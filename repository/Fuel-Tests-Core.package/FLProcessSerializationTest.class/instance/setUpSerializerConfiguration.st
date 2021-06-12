running
setUpSerializerConfiguration
	super setUpSerializerConfiguration.
	
	self serializerConfig
		at: #useDelayedMock
		put: true