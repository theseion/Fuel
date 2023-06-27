tests-serialization
testDifferentMinor
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
			minor: 3
			patch: 3).
	self assertSerializationEqualityOf: 'content'