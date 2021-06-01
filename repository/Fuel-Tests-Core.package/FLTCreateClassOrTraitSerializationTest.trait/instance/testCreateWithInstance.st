tests
testCreateWithInstance
	"Tests materialization of an internal class or trait together with an object using it."
	
	| aClassOrTrait materializedObjects objectsToSerialize anInstance |
	aClassOrTrait := self newClassOrTrait.
	self classFactory
		silentlyCompile:  'fortyTwo ^42'
		in: aClassOrTrait.
	anInstance := self newInstanceFrom: aClassOrTrait.
	objectsToSerialize := Array 
		with: aClassOrTrait 
		with: anInstance
		with: anInstance class.

	materializedObjects := self resultOfSerializeRemoveAndMaterializeAll: objectsToSerialize.

	self assert: (materializedObjects first includesSelector: #fortyTwo).
	self assert: 42 equals: (materializedObjects second perform: #fortyTwo)