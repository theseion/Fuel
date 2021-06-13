tests
testSameSignature
	self serializer
		at: #signature
		put: 'FUELx'.
	self materializer
		at: #signature
		put: 'FUELx'.
	self assertSerializationEqualityOf: 'content'