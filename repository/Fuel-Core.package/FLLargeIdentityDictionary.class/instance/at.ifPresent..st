accessing
at: key ifPresent: presentBlock
	^ self
		at: key
		ifPresent: presentBlock
		ifAbsent: []