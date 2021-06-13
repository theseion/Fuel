configuring-stream
streamFinalizer: aBlock
	map
		at: #streamFinalizer
		ifPresent: [ :finalizer |
			FLConfigurationError signal: 'Stream finalizer already configured. ',
				'Did you mean to use #decorateStreamFinalizer:?' ]
		ifAbsentPut: [ aBlock ]