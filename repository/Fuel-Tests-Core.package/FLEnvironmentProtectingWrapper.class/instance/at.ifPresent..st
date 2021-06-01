accessing
at: key ifPresent: aBlock
	^ overlay
		at: key
		ifPresent: [ :value |
			self
				checkReturn: value
				forKey: key.
			aBlock cull: value ]
		ifAbsent: [
			environment
				at: key
				ifPresent: aBlock ]