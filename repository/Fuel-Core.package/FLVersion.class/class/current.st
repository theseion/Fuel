accessing
current
	^ Current ifNil: [
		Current := self
			newWithMajor: 5
			minor: 2
			patch: 0 ]