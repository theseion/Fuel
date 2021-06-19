exception-handling
handleObjectLimitExceeded
	map
		at: #objectLimitExceededWarningRaised
		ifPresent: [ ^ self ]
		ifAbsentPut: [ true].
		
	self configuration isLimitObjectsExceptionEnabled ifFalse: [ ^ self ].

	FLObjectLimitExceededWarning signal