accessing
associationAt: key
	^ overlay
		associationAt: key
		ifAbsent: [
			environment associationAt: key ]