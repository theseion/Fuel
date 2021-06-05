*Fuel-Debug
doesNeedDebugging
	^ self
		at: #needDebugging
		ifAbsent: [ self class defaultNeedsDebugging ]