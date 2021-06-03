accessing
at: key ifPresent: presentBlock ifAbsentPut: absentBlock
	^ self
		at: key
		ifPresent: [ :value |
			value == sentinel
				ifTrue: [
					self
						at: key
						put: absentBlock value ]
				ifFalse: [ presentBlock cull: value ] ]
		ifAbsent: [
			self
				at: key
				put: absentBlock value ]