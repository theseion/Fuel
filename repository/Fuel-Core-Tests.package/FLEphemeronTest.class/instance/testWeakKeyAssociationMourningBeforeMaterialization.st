tests
testWeakKeyAssociationMourningBeforeMaterialization
	"This tests serialization / materialization of WeakKeyAssociation, which is an ephemeron class.
	When the key is not strongly referenced, which is the case here, the garbage collector
	will send #mourn to the object to finalize it. This will cause the ephemeron to remove itself
	from its container."

	| dictionary ephemeron materializedDictionary |
	dictionary := Dictionary new.
	ephemeron := WeakKeyAssociation new
		key: Object new;
		value: 'value';
		container: dictionary.
	dictionary add: ephemeron.

	self deny: dictionary isEmpty.
	
	self serialize: dictionary.
	Smalltalk garbageCollect.
	self assert: dictionary isEmpty.
	
	materializedDictionary := self materialized.
	self deny: materializedDictionary isEmpty.
	self assert: materializedDictionary size equals: 1.
	self assert: materializedDictionary associations first key isNil.
	self assert: materializedDictionary associations first value equals: 'value'.
	
	Smalltalk garbageCollect.
	self deny: materializedDictionary isEmpty