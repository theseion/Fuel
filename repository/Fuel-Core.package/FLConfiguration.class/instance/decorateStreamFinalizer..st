configuring-stream
decorateStreamFinalizer: aBlock
	map
		at: #streamFinalizer
		ifPresent: [ :finalizer |
			map
				at: #streamFinalizer
				put: [ :stream |
					aBlock value: stream.
					finalizer value: stream ] ]
		ifAbsent: [
			FLConfigurationError signal: 'No stream finalizer configured yet. ',
				'Did you mean to use #streamFinalizer:? ',
				'Or did you forget to supply a stream finalizer first?' ]