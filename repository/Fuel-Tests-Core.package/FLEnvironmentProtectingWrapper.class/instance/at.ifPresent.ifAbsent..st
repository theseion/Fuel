accessing
at: key ifPresent: presentBlock ifAbsent: absentBlock
	^ overlay
		at: key
		ifPresent: presentBlock
		ifAbsent: [
			environment
				at: key
				ifPresent: presentBlock
				ifAbsent: absentBlock ]