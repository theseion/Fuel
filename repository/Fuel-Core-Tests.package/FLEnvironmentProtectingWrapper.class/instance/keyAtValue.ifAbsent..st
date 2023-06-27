accessing
keyAtValue: anObject ifAbsent: aBlock
	^ overlay
		keyAtValue: anObject
		ifAbsent: [
			environment
				keyAtValue: anObject
				ifAbsent: aBlock ]