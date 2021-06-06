accessing
at: aKey ifAbsent: aBlock
	^ map
		at: aKey
		ifAbsent: aBlock