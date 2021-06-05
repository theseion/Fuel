testing
hasMultipleObjects
	^ self
		at: #hasMultipleObjects
		ifAbsent: [ self class defaultHasMultipleObjects ]