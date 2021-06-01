accessing
at: key ifAbsent: aBlock
	^ overlay
		at: key
		ifAbsent: [
			environment
				at: key
				ifAbsent: aBlock ]