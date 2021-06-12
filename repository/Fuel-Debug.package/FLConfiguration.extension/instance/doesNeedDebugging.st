*Fuel-Debug
doesNeedDebugging
	^ map
		at: #needDebugging
		ifAbsent: [ self class defaultNeedsDebugging ]