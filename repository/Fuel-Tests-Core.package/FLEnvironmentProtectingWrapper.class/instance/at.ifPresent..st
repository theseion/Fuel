accessing
at: key ifPresent: aBlock
	^ overlay
		at: key
		ifPresent: aBlock
		ifAbsent: [
			environment
				at: key
				ifPresent: aBlock ]