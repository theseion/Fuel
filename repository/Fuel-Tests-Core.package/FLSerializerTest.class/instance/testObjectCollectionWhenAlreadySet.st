tests-configuring
testObjectCollectionWhenAlreadySet
	serializer := FLSerializer new
		objectCollection: (Array new: 0);
		yourself.
	
	self
		should: [ serializer objectCollection: (Array new: 0) ]
		raise: FLConfigurationError