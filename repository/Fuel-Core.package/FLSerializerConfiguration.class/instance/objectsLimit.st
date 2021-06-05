as yet unclassified
objectsLimit
	^ self
		at: #objectsLimit
		ifAbsent: [ self class defaultObjectsLimit ]