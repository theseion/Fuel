accessing
at: key ifPresent: presentBlock ifAbsentPut: absentBlock
	^ self
		at: key
		ifPresent: [ :value |
			self
				checkReturn: value
				forKey: key.
			presentBlock cull: value ]
		ifAbsent: [
			self
				at: key
				put: absentBlock value ]