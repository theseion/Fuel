tests
testSameSignature
	self serializerConfig
		at: #signature
		put: 'FUELx'.
	self materializerConfig
		at: #signature
		put: 'FUELx'.
	self assertSerializationEqualityOf: 'content'