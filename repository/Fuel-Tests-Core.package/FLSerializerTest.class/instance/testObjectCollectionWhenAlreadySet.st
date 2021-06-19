tests-configuring
testObjectCollectionWhenAlreadySet
	self serializer objectCollection: (Array new: 0).
	
	self
		should: [ self serializer objectCollection: (Array new: 0) ]
		raise: FLConfigurationError