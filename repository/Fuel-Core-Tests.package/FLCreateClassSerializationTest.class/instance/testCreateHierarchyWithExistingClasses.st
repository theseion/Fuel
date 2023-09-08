tests
testCreateHierarchyWithExistingClasses
	"Tests materialization of a hierarchy of classes that are not defined in the image and classes that indeed are defined"

	| serializedClasses materializedClasses a b c d |
	a := self classFactory silentlyNewClass.
	b := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: a ].
	c := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: a ].
	d := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: Date ].
	serializedClasses := { a . b . c . d }.

	materializedClasses := self resultOfSerializeRemoveAndMaterializeAll: serializedClasses.

	self assert: serializedClasses size equals: materializedClasses size.

	serializedClasses withIndexDo: [ :aClass :index | self deny: aClass identicalTo: (materializedClasses at: index) ].
	self assert: Object identicalTo: materializedClasses first superclass.
	self assert: materializedClasses first identicalTo: materializedClasses second superclass.
	self assert: materializedClasses first identicalTo: materializedClasses third superclass.
	"Notice that the superclass of d is Date and since it is present in the image, we need exactly that instance."
	self assert: Date identicalTo: materializedClasses fourth superclass.

	self assert: (Set with: materializedClasses second with: materializedClasses third) equals: materializedClasses first subclasses asSet.
	self assertEmpty: materializedClasses second subclasses.
	self assertEmpty: materializedClasses third subclasses.
	self assertEmpty: materializedClasses fourth subclasses.

	self deny: (Object subclasses identityIncludes: materializedClasses first).
	self deny: (Date subclasses identityIncludes: materializedClasses fourth)