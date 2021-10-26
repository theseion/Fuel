configuring-stream
streamFactory: aBlock
	aBlock isBlock ifFalse: [
		FLConfigurationError signal: 'Stream factory must be a block' ].
	aBlock numArgs = 0 ifFalse: [
		FLConfigurationError signal: 'The block must no accept any arguments' ].
	
	map
		at: #streamFactory
		ifPresent: [ :factory |
			FLConfigurationError signal: 'Stream factory already configured. ',
				'Did you mean to use #decorateStreamFactory:?' ]
		ifAbsentPut: [ aBlock ]