accessing
streamFinalizer
	^ self
		at: #streamFinalizer
		ifAbsent: [ [ :stream | stream close] ]