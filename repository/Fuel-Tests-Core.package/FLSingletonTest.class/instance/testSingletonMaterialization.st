tests
testSingletonMaterialization
	| singleton materialized |
	singleton := FLSingletonMock instance.
	singleton reference: 'a reference'.
	self assert: singleton equals: FLSingletonMock instance.

	materialized := self resultOfSerializeAndMaterialize: singleton.
	self deny: materialized identicalTo: singleton.
	self deny: materialized reference isNil.
	self deny: materialized reference identicalTo: singleton reference.

	FLSingletonMock reset	"cannot do this in tearDown because that's used by some helper methods"