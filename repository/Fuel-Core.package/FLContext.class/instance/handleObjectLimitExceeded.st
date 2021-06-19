exception-handling
handleObjectLimitExceeded
	map
		at: #objectLimitExceededWarningRaised
		ifPresent: [ ^ self ]
		ifAbsentPut: true.
		
	FLObjectLimitExceededWarning signal