tests
testDifferentMajor
	self serializer
		at: #version
		put: (FLVersion
			newWithMajor: 2
			minor: 2
			patch: 3).
	self materializer
		at: #version
		put: (FLVersion
			newWithMajor: 3
			minor: 2
			patch: 3).
	self
		should: [ self resultOfSerializeAndMaterialize: 'content' ]
		raise: FLBadVersion
		whoseDescriptionIncludes: '2'
		description: 'The materializer should raise an error when version differs of the expected one.'