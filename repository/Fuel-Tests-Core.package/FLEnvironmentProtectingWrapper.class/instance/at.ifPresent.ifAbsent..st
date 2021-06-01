accessing
at: key ifPresent: presentBlock ifAbsent: absentBlock
	^ overlay
		at: key
		ifPresent: [ :value |
			self
				checkReturn: value
				forKey: key.
			presentBlock cull: value ]
		ifAbsent: [
			environment
				at: key
				ifPresent: presentBlock
				ifAbsent: absentBlock ]