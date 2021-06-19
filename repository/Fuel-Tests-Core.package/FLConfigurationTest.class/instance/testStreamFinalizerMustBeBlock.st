tests-configuring-stream
testStreamFinalizerMustBeBlock
	{
		#streamFinalizer:.
		Object new.
		Object
	} do: [ :block |
		self
			should: [ FLSerializer new streamFinalizer: block ]
			raise: FLConfigurationError.
		self
			should: [ FLMaterializer new streamFinalizer: block ]
			raise: FLConfigurationError ].
		
	self
		shouldnt: [ FLSerializer new streamFinalizer: [ :a ] ]
		raise: FLConfigurationError.
	self
		shouldnt: [ FLMaterializer new streamFinalizer: [ :a ] ]
		raise: FLConfigurationError