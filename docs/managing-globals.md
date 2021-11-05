+++
type = "docs"
+++
Let us assume a `CompiledMethod` is referenced from the graph to serialize. Sometimes we may be interested in storing just the selector and name of the class, because we know it will be present when materializing the graph. However, sometimes we want to really store the method with full detail.This means that given an object graph, there is not an unique way of serializing it. Fuel offers dynamic and static mechanisms to customize this.

## Default globals
By default, Fuel considers following objects as globals, i.e. will store just its name:
- `nil`, `true`, `false`, and `Smalltalk globals`.
- Any `Class`, `Trait`, `Metaclass` or `ClassTrait`.
- Any `CompiledMethod` (except when either it `#isInstalled` not or `#isDoIt`, for example, the code is evaluated from Workspace).
- Some well-known global variables: `Smalltalk` `SourceFiles` `Transcript` `Undeclared` `Display` `TextConstants` `ActiveWorld` `ActiveHand` `ActiveEvent` `Sensor` `Processor` `ImageImports` `SystemOrganization` `World`.
Custom globals are duplicated
In this following code snippet we show that by default the global value is not serialized as a global, and so it is duplicated on materialization.
```smalltalk
 "Define a global variable named #SomeGlobal."
 SomeGlobal := Set new.
 
 "Serialize and materialize the value of #SomeGlobal."
 FLSerializer 
 	serialize: SomeGlobal 
 	toFileNamed: 'g.fuel'.
 
 "The materialized object *is not* the same as the global instance."
 [ (FLMaterializer materializeFromFileNamed: 'g.fuel') ~~ SomeGlobal ] assert.
```
But...

## How to avoid duplication
Instead, in the code below, `#considerGlobal:` is used to specify that it should be stored as global.
```smalltalk
 | aSerializer |
 
 "Define a global variable named #SomeGlobal."
 SomeGlobal := Set new.
 
 aSerializer := FLSerializer newDefault.
 
 "Tell the serializer to consider #SomeGlobal as global."
 aSerializer analyzer considerGlobal: #SomeGlobal.
 
 aSerializer 
 	serialize: SomeGlobal 
 	toFileNamed: 'g.fuel'.
 	
 "In this case, the materialized object *is* the same as the global instance."
 [ (FLMaterializer materializeFromFileNamed: 'g.fuel') == SomeGlobal ] assert.
```
This feature is tested in tests-globals protocol of `FLBasicSerializationTest` as well in `FLGlobalEnvironmentTest`.
Changing the environment
It is possible to specify where the global will be looked-up during materialization. The method `#globalEnvironment:` exists for that purpose, as the following example shows.
```smalltalk
 | aSerializer aMaterializer anEnvironment |
 
 "Define a global variable named #SomeGlobal."
 SomeGlobal := Set new.
 
 "Tell the serializer to consider #SomeGlobal as global."
 aSerializer := FLSerializer newDefault.
 aSerializer analyzer considerGlobal: #SomeGlobal.
 aSerializer 
 	serialize: SomeGlobal 
 	toFileNamed: 'g.fuel'.
 
 "Override value for #SomeGlobal."
 anEnvironment := Dictionary newFrom: Smalltalk globals.
 anEnvironment at: #SomeGlobal put: {42}.
 
 "In this case, the materialized object *is the same* as the global instance."
 FileStream oldFileNamed: 'g.fuel' do: [ :aStream |
 	aStream binary.
 	aMaterializer := FLMaterializer newDefault.
 	
 	"Set the environment"
 	aMaterializer globalEnvironment: anEnvironment.
 
 	[ (aMaterializer materializeFrom: aStream) root = {42} ] assert ]
```
This feature is tested in the class `FLGlobalEnvironmentTest`. The global environment can be setted also for serialization (not only materialization), but we don't include an example for that case.
Let us assume a `CompiledMethod` is referenced from the graph to serialize. Sometimes we may be interested in storing just the selector and name of the class, because we know it will be present when materializing the graph. However, sometimes we want to really store the method with full detail.

This means that given an object graph, there is not an unique way of serializing it. Fuel offers dynamic and static mechanisms to customize this.