tests
testPrivateExcluded
	| result |
	self serializer
		when: [ :x | x isBehavior ]
		substituteBy: [ :x | FLWeakClassMock ].

	result := self resultOfSerializeAndMaterialize: {String new . FLPair}.

	self assert: result first class identicalTo: ByteString.
	self assert: result second identicalTo: FLWeakClassMock