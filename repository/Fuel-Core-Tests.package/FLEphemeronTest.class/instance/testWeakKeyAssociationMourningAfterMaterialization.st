tests
testWeakKeyAssociationMourningAfterMaterialization
	"This tests serialization / materialization of WeakKeyAssociation, which is an ephemeron class.
	When the key is not strongly referenced, which is the case here, the garbage collector
	will send #mourn to the object to finalize it. This will cause the ephemeron to remove itself
	from its container."

	| dictionary ephemeron materializedDictionary materializedAssociation |
	dictionary := Dictionary new.
	ephemeron := WeakKeyAssociation new
		key: Object new;
		value: 'value';
		container: dictionary.
	dictionary add: ephemeron.

	materializedDictionary := self resultOfSerializeAndMaterialize: dictionary.
	self deny: materializedDictionary isEmpty.
	self assert: materializedDictionary size equals: 1.
	materializedAssociation := materializedDictionary associations first.
	self assert: materializedAssociation key isNil.
	self assert: materializedAssociation value equals: 'value'.
		
	Smalltalk garbageCollect.
	self deny: materializedDictionary isEmpty