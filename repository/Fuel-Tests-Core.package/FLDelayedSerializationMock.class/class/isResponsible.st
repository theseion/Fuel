testing
isResponsible
	^ self configuration
		at: #useDelayedMock
		ifAbsent: [ false ]