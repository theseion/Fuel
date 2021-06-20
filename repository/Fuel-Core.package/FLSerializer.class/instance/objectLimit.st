accessing
objectLimit
	^ map
		at: #objectLimit
		ifAbsent: [ self class defaultObjectsLimit ]