tests-configuring
testEnvironmentWhenAlreadySet
	self
		should: [ self serializer environment: Dictionary new ]
		raise: FLConfigurationError.
		
	self
		should: [ self materializer environment: Dictionary new ]
		raise: FLConfigurationError