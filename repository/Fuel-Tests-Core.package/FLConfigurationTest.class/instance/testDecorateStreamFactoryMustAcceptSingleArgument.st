tests-configuring-stream
testDecorateStreamFactoryMustAcceptSingleArgument
	{
		[].
		[ :a :b ].
		[ :a :b :c ]
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
		shouldnt: [ self materializer decorateStreamFactory: [ :a ] ]
		raise: FLConfigurationError