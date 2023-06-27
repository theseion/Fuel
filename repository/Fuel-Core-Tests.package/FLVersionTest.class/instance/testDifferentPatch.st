tests-serialization
testDifferentPatch
	self serializer
		at: #version
		put: (FLVersion
			newWithMajor: 1
			minor: 2
			patch: 3).
	self materializer
		at: #version
		put: (FLVersion
			newWithMajor: 1
			minor: 2
			patch: 4).
	self assertSerializationEqualityOf: 'content'