tests
testTransientPair

	| result |
	self serializerConfig
		when: [:x | FLPair = x class]
		substituteBy: [:x | nil].

	result := self resultOfSerializeAndMaterialize: FLPair new.
	
	self assert: result isNil.