private
at: aKey ifAbsentPut: aBlock
	^ self map
		at: aKey
		ifAbsentPut: aBlock