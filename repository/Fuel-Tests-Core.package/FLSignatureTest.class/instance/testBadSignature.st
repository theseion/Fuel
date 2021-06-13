tests
testBadSignature
	self serializer
		at: #signature
		put: 'FUELx'.
	self materializer
		at: #signature
		put: 'FUELy'.
		
	self
		should: [ self resultOfSerializeAndMaterialize: 'content' ]
		raise: FLBadSignature
		whoseDescriptionIncludes: 'FUELy'
		description: 'The materializer should raise an error when signature differs of the expected one.'