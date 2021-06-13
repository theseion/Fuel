testing
isLimitObjectsExceptionEnabled
	^ map
		at: #limitObjectsExceptionEnabled
		ifAbsent: [ self class defaultLimitObjectsExceptionEnabled ]