accessing
objectsLimit
	^ map
		at: #objectsLimit
		ifAbsent: [ self class defaultObjectsLimit ]