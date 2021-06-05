accessing
streamStrategy
	^ self
		at: #streamStrategy
		ifAbsent: [ self class defaultStreamStrategy ]