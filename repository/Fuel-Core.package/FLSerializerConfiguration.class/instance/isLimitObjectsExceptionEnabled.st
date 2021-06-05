testing
isLimitObjectsExceptionEnabled
	^ self
		at: #limitObjectsExceptionEnabled
		ifAbsent: [ self class defaultLimitObjectsExceptionEnabled ]