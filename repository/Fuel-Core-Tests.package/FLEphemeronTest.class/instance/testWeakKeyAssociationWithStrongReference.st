tests
testWeakKeyAssociationWithStrongReference
	"This tests serialization / materialization of WeakKeyAssociation, which is an ephemeron class.
	When the key is strongly referenced, which is the case here, the garbage collector will
	not finalize the ephemeron."

	| dictionary key ephemeron materializedDictionary |
	dictionary := Dictionary new.
	key := Object new.
	ephemeron := WeakKeyAssociation new
		key: key;
		value: 'value';
		container: dictionary.
	dictionary add: ephemeron.

	self deny: dictionary isEmpty.
	
	self serialize: dictionary.
	Smalltalk garbageCollect.
	self deny: dictionary isEmpty.
	
	materializedDictionary := self materialized.
	self deny: materializedDictionary isEmpty.
	self assert: materializedDictionary size equals: 1.
	self assert: materializedDictionary associations first key isNil.
	self assert: materializedDictionary associations first value equals: 'value'.
	
	Smalltalk garbageCollect.
	self deny: materializedDictionary isEmpty