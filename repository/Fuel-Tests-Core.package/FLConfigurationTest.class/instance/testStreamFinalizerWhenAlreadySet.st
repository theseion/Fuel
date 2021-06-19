tests-configuring-stream
testStreamFinalizerWhenAlreadySet
	self serializer streamFinalizer: [].
	self materializer streamFinalizer: [].
	
	self
		should: [ self serializer streamFinalizer: [] ]
		raise: FLConfigurationError.	
	self
		should: [ self materializer streamFinalizer: [] ]
		raise: FLConfigurationError.