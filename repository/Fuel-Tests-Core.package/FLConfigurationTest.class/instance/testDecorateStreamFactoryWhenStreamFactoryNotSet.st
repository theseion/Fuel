tests-configuring-stream
testDecorateStreamFactoryWhenStreamFactoryNotSet
	self
		should: [ FLSerializer new decorateStreamFactory: [ :stream ] ]
		raise: FLConfigurationError.
	self
		should: [ FLMaterializer new decorateStreamFactory: [ :stream ] ]
		raise: FLConfigurationError
		