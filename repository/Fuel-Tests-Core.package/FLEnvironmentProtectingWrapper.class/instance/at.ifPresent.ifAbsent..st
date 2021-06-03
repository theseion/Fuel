accessing
at: key ifPresent: presentBlock ifAbsent: absentBlock
	^ overlay
		at: key
		ifPresent: [ :value |
			value == sentinel
				ifTrue: absentBlock
				ifFalse: [ presentBlock cull: value ] ]
		ifAbsent: [
			environment
				at: key
				ifPresent: presentBlock
				ifAbsent: absentBlock ]