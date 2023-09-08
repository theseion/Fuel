tests
testCreateHierarchy
	"Tests materialization of a hierarchy of classes that is not defined in the image"

	| serializedClasses materializedClasses a b c d |
	a := self classFactory silentlyNewClass.
	b := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: a ].
	c := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: a ].
	d := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: c ].
	serializedClasses := { a . b . c . d }.

	materializedClasses := self resultOfSerializeRemoveAndMaterializeAll: serializedClasses.

	self assert: serializedClasses size equals: materializedClasses size.

	serializedClasses withIndexDo: [ :aClass :index | self deny: aClass identicalTo: (materializedClasses at: index) ].

	self assert: Object equals: materializedClasses first superclass.
	self assert: materializedClasses first equals: materializedClasses second superclass.
	self assert: materializedClasses first equals: materializedClasses third superclass.
	self assert: materializedClasses third equals: materializedClasses fourth superclass.

	self assert: (Set with: materializedClasses second with: materializedClasses third) equals: materializedClasses first subclasses asSet.
	self assertEmpty: materializedClasses second subclasses.
	self assert: (Set with: materializedClasses fourth) equals: materializedClasses third subclasses asSet.
	self assertEmpty: materializedClasses fourth subclasses.
	"Notice that the instVar subclasses is only filled with classes inside the serialization. But for exernal classes Fuel does nothing. In this case,  FLStubA should NOT be added to Object subclasses."
	self deny: (Object subclasses includes: materializedClasses first).
	self deny: (Object subclasses identityIncludes: materializedClasses first)