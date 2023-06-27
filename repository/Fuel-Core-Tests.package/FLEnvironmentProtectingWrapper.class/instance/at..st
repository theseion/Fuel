accessing
at: key
	^ overlay
		at: key
		ifPresent: [ :value |
			self
				checkReturn: value
				forKey: key.
			value ]
		ifAbsent: [ environment at: key ]