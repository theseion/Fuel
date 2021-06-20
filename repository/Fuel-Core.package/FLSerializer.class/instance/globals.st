accessing
globals
	^ map
		at: #computedGlobals
		ifAbsentPut: [ self computeGlobals ]