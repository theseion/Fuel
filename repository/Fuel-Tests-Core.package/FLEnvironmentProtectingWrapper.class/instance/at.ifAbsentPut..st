accessing
at: key ifAbsentPut: aBlock
	^ overlay
		at: key
		ifAbsentPut: aBlock