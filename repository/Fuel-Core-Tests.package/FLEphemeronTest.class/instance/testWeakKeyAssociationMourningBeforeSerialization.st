tests
testWeakKeyAssociationMourningBeforeSerialization
	"This tests serialization / materialization of WeakKeyAssociation, which is an ephemeron class.
	When the key is not strongly referenced, which is the case here, the garbage collector
	will send #mourn to the object to finalize it. This will cause the ephemeron to remove itself
	from its container."

	| dictionary ephemeron |
	dictionary := Dictionary new.
	ephemeron := WeakKeyAssociation new
		key: Object new;
		value: 'value';
		container: dictionary.
	dictionary add: ephemeron.

	Smalltalk garbageCollect.
	self assert: dictionary isEmpty