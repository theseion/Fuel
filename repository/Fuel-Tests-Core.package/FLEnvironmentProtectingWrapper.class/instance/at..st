accessing
at: key
	^ self
		checkReturn: (overlay
			at: key
			ifAbsent: [
				environment at: key ])
		forKey: key