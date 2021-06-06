accessing
value: aContext during: aBlock
	^ [ super
		value: aContext
		during: aBlock ] ensure: [
			aContext finalizeOperations ]