tests-configuring-stream
testDecorateStreamFactoryMustBeBlock
	{
		#streamFactory:.
		Object new.
		Object
	} do: [ :block |
		self
			should: [ self serializer decorateStreamFactory: block ]
			raise: FLConfigurationError.
		self
			should: [ self materializer decorateStreamFactory: block ]
			raise: FLConfigurationError ].
		
	self
		shouldnt: [ self serializer decorateStreamFactory: [ :a ] ]
		raise: FLConfigurationError.
	self
		shouldnt: [ self serializer decorateStreamFactory: [ :a ] ]
		raise: FLConfigurationError