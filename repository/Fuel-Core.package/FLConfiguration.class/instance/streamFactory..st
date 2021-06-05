accessing
streamFactory: aBlock
	self
		at: #streamFactory
		ifPresent: [
			FLConfigurationError signal: 'Stream factory already configured. ',
				'Did you mean to use #decorateStreamFactory:?' ]
		ifAbsentPut: [ aBlock ]