configuring-stream
streamFinalizer: aBlock
	aBlock isBlock ifFalse: [
		FLConfigurationError signal: 'Stream finalizer must be a block' ].
	aBlock numArgs = 1 ifFalse: [
		FLConfigurationError signal: 'The block must accept the stream as single argument' ].
	
	map
		at: #streamFinalizer
		ifPresent: [
			FLConfigurationError signal: 'Stream finalizer already configured' ]
		ifAbsentPut: [ aBlock ]