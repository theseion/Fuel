private
at: aKey ifAbsent: aBlock
	^ self map
		at: aKey
		ifAbsent: aBlock