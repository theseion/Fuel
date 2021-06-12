accessing
streamFinalizer
	^ map
		at: #streamFinalizer
		ifAbsent: [ [ :stream | stream close] ]