tests-configuring
testObjectWhenAlreadySet
	serializer := FLSerializer new
		object: Object new;
		yourself.
	
	self
		should: [ serializer object: Object new ]
		raise: FLConfigurationError