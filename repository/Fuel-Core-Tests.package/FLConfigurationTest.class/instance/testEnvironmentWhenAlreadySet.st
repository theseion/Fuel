tests-configuring
testEnvironmentWhenAlreadySet
	serializer := FLSerializer new
		environment: self environmentOfTest;
		yourself.
	materializer := FLMaterializer new
		environment: self environmentOfTest;
		yourself.

	self
		should: [ serializer environment: Dictionary new ]
		raise: FLConfigurationError.
		
	self
		should: [ materializer environment: Dictionary new ]
		raise: FLConfigurationError