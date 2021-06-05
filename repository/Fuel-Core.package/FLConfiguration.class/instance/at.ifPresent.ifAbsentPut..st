private
at: aKey ifPresent: presentBlock ifAbsentPut: absentBlock
	^ self map
		at: aKey
		ifPresent: presentBlock
		ifAbsentPut: absentBlock