configuring-stream
decorateStreamFactory: aBlock
	aBlock isBlock ifFalse: [
		FLConfigurationError signal: 'Stream factory must be a block' ].
	aBlock numArgs = 1 ifFalse: [
		FLConfigurationError signal: 'The block must accept the original stream as single argument' ].
	
	map
		at: #streamFactory
		ifPresent: [ :factory |
			map
				at: #streamFactory
				put: [ aBlock cull: factory value ] ]
		ifAbsent: [
			FLConfigurationError signal: 'No stream factory configured yet. ',
				'Did you mean to use #streamFactory:? ',
				'Or did you forget to supply a stream factory first?' ]