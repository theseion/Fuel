accessing
streamFactory
	^ map
		at: #streamFactory
		ifAbsent: [ FLConfigurationError signal: 'No stream factory provided' ]