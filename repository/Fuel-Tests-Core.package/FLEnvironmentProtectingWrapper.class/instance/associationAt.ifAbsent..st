accessing
associationAt: key ifAbsent: aBlock
	^ overlay
		associationAt: key
		ifAbsent: [
			environment
				associationAt: key
				ifAbsent: aBlock ]