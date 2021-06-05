tests
testSameVersion
	self serializerConfig
		at: #version
		put: (FLVersion
			newWithMajor: 1
			minor: 2
			patch: 3).
	self materializerConfig
		at: #version
		put: (FLVersion
			newWithMajor: 1
			minor: 2
			patch: 3).
	self assertSerializationEqualityOf: 'content'