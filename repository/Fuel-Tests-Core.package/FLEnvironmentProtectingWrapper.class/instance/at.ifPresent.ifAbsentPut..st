accessing
at: key ifPresent: presentBlock ifAbsentPut: absentBlock
	^ self
		at: key
		ifPresent: presentBlock
		ifAbsent: [
			self
				at: key
				put: absentBlock value ]