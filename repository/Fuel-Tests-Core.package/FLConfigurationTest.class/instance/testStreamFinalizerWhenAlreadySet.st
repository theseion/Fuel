tests-configuring-stream
testStreamFinalizerWhenAlreadySet
	self serializer streamFinalizer: [ :x ].
	self materializer streamFinalizer: [ :x ].
	
	self
		should: [ self serializer streamFinalizer: [ :x ] ]
		raise: FLConfigurationError.	
	self
		should: [ self materializer streamFinalizer: [ :x ] ]
		raise: FLConfigurationError.