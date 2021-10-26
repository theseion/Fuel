exception-handling
handleObjectLimitExceeded
	map
		at: #objectLimitExceededWarningRaised
		ifPresent: [ :boolean | ^ self ]
		ifAbsentPut: [ true].
		
	self configuration isLimitObjectsExceptionEnabled ifFalse: [ ^ self ].

	FLObjectLimitExceededWarning signal