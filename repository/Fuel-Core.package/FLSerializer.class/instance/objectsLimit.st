as yet unclassified
objectsLimit
	^ map
		at: #objectsLimit
		ifAbsent: [ self class defaultObjectsLimit ]