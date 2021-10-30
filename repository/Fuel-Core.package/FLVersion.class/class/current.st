accessing
current
	^ Current ifNil: [
		Current := self
			newWithMajor: 4
			minor: 0
			patch: 0 ]