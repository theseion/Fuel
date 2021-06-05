accessing
streamFactory
	^ self
		at: #streamFactory
		ifAbsent: [ FLConfigurationError signal: 'No stream factory provided' ]