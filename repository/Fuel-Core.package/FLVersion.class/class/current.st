accessing
current
	^ Current ifNil: [
		Current := self
			newWithMajor: 3
			minor: 0
			patch: 3 ]