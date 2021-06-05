tests
testPrivateExcludedAndWithConflicts
	"Tests issue #209"

	| result |
	self serializerConfig
		when: [ :x | FLPair == x ]
		substituteBy: [ :x | FLWeakClassMock ].

	result := self resultOfSerializeAndMaterialize: {FLPair new . FLPair}.

	self assert: result first class identicalTo: FLPair.
	self assert: result second identicalTo: FLWeakClassMock