tests
testBadSignature
	self serializerConfig
		at: #signature
		put: 'FUELx'.
	self materializerConfig
		at: #signature
		put: 'FUELy'.
		
	self
		should: [ self resultOfSerializeAndMaterialize: 'content' ]
		raise: FLBadSignature
		whoseDescriptionIncludes: 'FUELy'
		description: 'The materializer should raise an error when signature differs of the expected one.'