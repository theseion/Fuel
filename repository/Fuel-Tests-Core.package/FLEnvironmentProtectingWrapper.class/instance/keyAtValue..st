accessing
keyAtValue: anObject
	^ overlay
		keyAtValue: anObject
		ifAbsent: [
			environment keyAtValue: anObject ]