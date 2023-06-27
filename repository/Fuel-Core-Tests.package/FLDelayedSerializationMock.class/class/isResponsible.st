testing
isResponsible
	^ self configuration class = FLSerializerMock and: [
		self configuration
			at: #useDelayedMock
			ifAbsent: [ false ] ]