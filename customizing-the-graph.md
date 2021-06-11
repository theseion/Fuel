# Ignoring Instance Variables
It can happen that instance variables should never be serialized. A practical way to do this is overriding the hook method #fuelIgnoredInstanceVariableNames. Let's say we have the class User and we do not want to serialize the instance variables 'acumulatedLogins' and 'applications'. So we implement:
```smalltalk
User class >> fuelIgnoredInstanceVariableNames
    ^#('acumulatedLogins' 'applications')
```
When materialized, such instance variables will be nil. If you want to re-initialize and set values to those instance variables, you can use #fuelAfterMaterialization for that.Be aware that in case of renaming those instance variables, you should rename that method as well. Notice also that the method #fuelIgnoredInstanceVariableNames is implemented at class side. This means that all instances of such class will ignore the defined instances variables. We test this feature in FLIgnoredVariablesTest.In StOMP serializer this same hook is called #stompTransientInstVarNames and in SIXX it is #sixxIgnorableInstVarNames.
Post-Materialization Action
The method `#fuelAfterMaterialization` lets us execute something once an object has been materialized. For example, let's say we would like to set back the instance variable 'acumulatedLogins' during materialization. Hence, we can implement:
```smalltalk
User >> fuelAfterMaterialization
 acumulatedLogins := 0. 
```
# Substitution on Serialization
Sometimes you may want to serialize something different than the original object, without altering them.
## Dynamic way
You can establish a pluggable substitution to a particular serialization. Let's illustrate with an example, where your graph includes a Stream and you want to serialize nil instead.
```smalltalk
objectToSerialize := Array with: 'hello' with: '' writeStream.

FileStream forceNewFileNamed: 'demo.fuel' do: [ :aStream |
    aSerializer := FLSerializer newDefault.
    aSerializer analyzer 
        when: [ :o | o isStream ] 
        substituteBy: [ :o | nil ].
    aSerializer         
        serialize: objectToSerialize
        on: aStream binary ].
```
So, when loading you will get `#('hello' nil)`, without any instance of a stream.You can find this code in `FLUserGuidesTest>>testPluggableSubstitution`.
## Static way
You have to override `#fuelAccept:` in the class of the object to be substituted. Fuel visits each object in the graph by sending this message, to determine how to trace and serialize it. Note that this will affect every serialization, in contrast with the 'dynamic way' we explained above; but it could be much faster.As an example, imagine we want to replace an object directly with nil. In other words, we want to make a whole object transient, say CachedResult. For that, we should implement:
```smalltalk
CachedResult >> fuelAccept: aGeneralMapper
    ^ aGeneralMapper visitSubstitution: self by: nil
```
As another example, we have a Proxy class and when serializing we want to serialize its target instead of the proxy. So we implement:
```smalltalk
Proxy >> fuelAccept: aGeneralMapper
    ^ aGeneralMapper visitSubstitution: self by: target
```
Notice that `#fuelAccept:` is the same as the previous example. The last example is when an object needs to change the value of its instance variables. Say we have again the class User and we want to nil the instance variable 'history' when its size is greater than 100.
```smalltalk
User >> fuelAccept: aGeneralMapper
    ^self history size > 100 
        ifTrue: [ 
            aGeneralMapper 
                visitSubstitution: self 
                by: (self copy history: Array new) ].
        ifFalse: [ super fuelAccept: aGeneralMapper ]
```
Note we are substituting the original user by another instance of User, which Fuel will visit with the same #fuelAccept: method. We could easily fall in an infinite sequence of substitutions if we don't take care. To avoid this problem, it is useful #visitSubstitution:by:onRecursionDo:, where you define an alternative mapping for the case of mapping an object which is already a substitute of another one:
```smalltalk
User >> fuelAccept: aGeneralMapper
    aGeneralMapper 
        visitSubstitution: self 
        by: (self copy history: #())
        onRecursionDo: [ super fuelAccept: aGeneralMapper ]
```
In the case, the substitute user (i.e. the one with the empty history) is will be visited via its super implementation.You can see tests for this functionality at FLHookedSubstitutionTest.
# Substitution on Materialization
## Global Sends
Suppose we have a special instance of User that represents the admin user, and it is an unique instance in the image. In case the admin user is referenced in our graph, we want to treat that object as a global. We can do that in this way:
```smalltalk
User >> fuelAccept: aGeneralMapper
    ^self == User admin
        ifTrue: [ 
            aGeneralMapper 
                visitGlobalSend: self 
                name: #User 
                selector: #admin ]
        ifFalse: [ super fuelAccept: aGeneralMapper ]
```
So what will happen is that during serialization, the admin user won't be completly serialized (with all its intance variables) but instead its global name and selector are stored. Then, at materialization time, Fuel will send #admin to the class User, and use what that answers as the admin user of the materialized graph. We test this feature in FLGlobalSendSerializationTest.
## Hooking instance creation
Fuel provides two hook methods to customise how instances are created: `#fuelNew` and `#fuelNew:`. For (regular) fixed objects, the method `#fuelNew` is defined in Behavior as:
```smalltalk
fuelNew
	^ self basicNew
```
But we can override it to our needs, for example:
```smalltalk
fuelNew
	^ self uniqueInstance
```
This similarly applies to variable objects through the method `#fuelNew:`, which by default answers `#basicNew:`. We test this feature in FLSingletonTest.
## Not Serializable Objects
You may want to be sure that some objects are not serialized. For this case we provide `#visitNotSerializable:`, which in next example forbids serialization of any instance of MyNotSerializableObject.
```smalltalk
MyNotSerializableObject >> fuelAccept: aGeneralMapper
    aGeneralMapper visitNotSerializable: self
```
We test this feature in `FLBasicSerializationTest>>testNotSerializableObject`.