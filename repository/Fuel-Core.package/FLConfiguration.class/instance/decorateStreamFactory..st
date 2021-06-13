configuring-stream
decorateStreamFactory: aBlock
	map
		at: #streamFactory
		ifPresent: [ :factory |
			map
				at: #streamFactory
				put: [ aBlock cull: factory value ].
			self streamFinalizer: [ :stream | stream close ] ]
		ifAbsent: [
			FLConfigurationError signal: 'No stream factory configured yet. ',
				'Did you mean to use #streamFactory:? ',
				'Or did you forget to supply a stream factory first?' ]