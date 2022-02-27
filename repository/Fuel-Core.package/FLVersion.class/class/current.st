accessing
current
	^ Current ifNil: [
		Current := self
			newWithMajor: 5
			minor: 0
			patch: 1 ]