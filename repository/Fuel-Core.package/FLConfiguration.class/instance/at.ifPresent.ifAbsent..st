private
at: aKey ifPresent: presentBlock ifAbsent: absentBlock
	^ self map
		at: aKey
		ifPresent: presentBlock
		ifAbsent: absentBlock