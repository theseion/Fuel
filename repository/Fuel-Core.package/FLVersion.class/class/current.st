accessing
current
	^ Current ifNil: [
		Current := self
			newWithMajor: 5
			minor: 1
			patch: 0 ]
