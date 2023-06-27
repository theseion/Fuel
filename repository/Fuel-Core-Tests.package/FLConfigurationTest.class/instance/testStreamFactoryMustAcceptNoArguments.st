tests-configuring-stream
testStreamFactoryMustAcceptNoArguments
	{
		[ :a ].
		[ :a :b ].
		[ :a :b :c ]
	} do: [ :block |
		self
			should: [ FLSerializer new streamFactory: block ]
			raise: FLConfigurationError.
		self
			should: [ FLMaterializer new streamFactory: block ]
			raise: FLConfigurationError ].
		
	self
		shouldnt: [ FLSerializer new streamFactory: [] ]
		raise: FLConfigurationError.
	self
		shouldnt: [ FLMaterializer new streamFactory: [] ]
		raise: FLConfigurationError