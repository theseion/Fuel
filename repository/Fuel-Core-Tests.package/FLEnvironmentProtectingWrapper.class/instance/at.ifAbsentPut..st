accessing
at: key ifAbsentPut: aBlock
	^ self
		at: key
		ifAbsent: [
			overlay
				at: key
				put: aBlock value ]