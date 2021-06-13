configuring-stream
streamFactory: aBlock
	map
		at: #streamFactory
		ifPresent: [
			FLConfigurationError signal: 'Stream factory already configured. ',
				'Did you mean to use #decorateStreamFactory:?' ]
		ifAbsentPut: [ aBlock ]