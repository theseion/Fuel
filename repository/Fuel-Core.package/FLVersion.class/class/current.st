accessing
current
	^ Current ifNil: [
		Current := self
			newWithMajor: 4
			minor: 1
			patch: 0 ]