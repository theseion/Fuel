configuring
objectCollection: aCollection
	aCollection isCollection ifFalse: [
		FLConfigurationError signal: 'Argument must be a collection' ].
	
	self object: aCollection.
	
	map
		at: #hasMultipleObjects
		put: true