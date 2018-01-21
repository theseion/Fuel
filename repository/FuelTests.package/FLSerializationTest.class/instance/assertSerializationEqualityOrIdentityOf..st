running
assertSerializationEqualityOrIdentityOf: anObject
	"Asserts that the original object and the materialized one are equal (may be the same)"

	| materialized |
	materialized := self resultOfSerializeAndMaterialize: anObject.
	self assert: anObject = materialized description: 'The materialized object should be equal to serialized one'.