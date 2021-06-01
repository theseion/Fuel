accessing
at: key ifAbsent: aBlock
	^ self
		checkReturn: (overlay
			at: key
			ifAbsent: [
				environment
					at: key
					ifAbsent: aBlock ])
		forKey: key