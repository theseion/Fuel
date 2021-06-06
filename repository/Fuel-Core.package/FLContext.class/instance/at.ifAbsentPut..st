accessing
at: aKey ifAbsentPut: anObject
	^ map
		at: aKey
		ifAbsentPut: anObject