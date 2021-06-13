testing
hasMultipleObjects
	^ map
		at: #hasMultipleObjects
		ifAbsent: [ self class defaultHasMultipleObjects ]