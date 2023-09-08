tests
testCreateWithSubclass
	"Tests materialization of a class that has a external subclass. Currently, this is the expected behaviour."

	| serializedClass aSubclass materializedClass |
	serializedClass := self classFactory silentlyNewClass.
	aSubclass := self classFactory silentlyMake: [ :aBuilder | aBuilder superclass: serializedClass ].

	materializedClass := self resultOfSerializeRemoveAndMaterialize: serializedClass.
	self assert: materializedClass subclasses size equals: 1.
	self assert: materializedClass subclasses first identicalTo: aSubclass