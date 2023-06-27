tests-configuring-stream
testStreamFactoryWhenAlreadySet
	self
		should: [ self serializer streamFactory: [] ]
		raise: FLConfigurationError.
	self
		should: [ self materializer streamFactory: [] ]
		raise: FLConfigurationError