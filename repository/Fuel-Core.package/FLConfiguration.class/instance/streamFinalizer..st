configuring-stream
streamFinalizer: aBlock
	map
		at: #streamFinalizer
		ifPresent: [
			FLConfigurationError signal: 'Stream finalizer already configured' ]
		ifAbsentPut: [ aBlock ]