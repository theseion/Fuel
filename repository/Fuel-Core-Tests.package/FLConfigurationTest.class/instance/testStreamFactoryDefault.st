tests-configuring-stream
testStreamFactoryDefault
	self
		should: [ FLSerializer new streamFactory ]
		raise: FLConfigurationError.
	self
		should: [ FLMaterializer new streamFactory ]
		raise: FLConfigurationError