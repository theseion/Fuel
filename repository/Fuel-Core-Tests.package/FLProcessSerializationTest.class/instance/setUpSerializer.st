running
setUpSerializer
	super setUpSerializer.
	
	self serializer
		at: #useDelayedMock
		put: true