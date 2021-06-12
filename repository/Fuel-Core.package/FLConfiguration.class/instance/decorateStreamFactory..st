accessing
decorateStreamFactory: aBlock
	map
		at: #streamFactory
		ifPresent: [ :factory |
			self
				at: #streamFactory put: [ aBlock cull: factory value ];
				streamFinalizer: [ :stream | stream close ] ]
		ifAbsent: [
			FLConfigurationError signal: 'No stream factory configured yet. ',
				'Did you mean to use #streamFactory:? ',
				'Or did you forget to supply a stream factory first?' ]