accessing
at: key ifAbsent: aBlock
	^ self
		at: key
		ifPresent: [ :value | ^ value ]
		ifAbsent: aBlock