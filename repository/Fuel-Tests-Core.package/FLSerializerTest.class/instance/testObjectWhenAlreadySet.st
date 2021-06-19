tests-configuring
testObjectWhenAlreadySet
	self serializer object: Object new.
	
	self
		should: [ self serializer object: Object new ]
		raise: FLConfigurationError