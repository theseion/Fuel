tests
testCreateWithSubclass
	"Tests materialization of a class that has a external subclass. Currently, this is the expected behaviour."
	
	| serializedClass aSubclass materializedClass |	
	serializedClass := self classFactory silentlyNewClass.
	aSubclass := self classFactory silentlyNewSubclassOf: serializedClass.
	
	materializedClass := self resultOfSerializeRemoveAndMaterialize: serializedClass.

	self assert: materializedClass subclasses size = 1.
	self assert: materializedClass subclasses first == aSubclass.