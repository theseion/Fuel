configuring-globals
lookUpAllInGlobals: aCollection
	aCollection isCollection ifFalse: [
		FLConfigurationError signal: 'Argument must be collection' ].
	
	aCollection do: [ :object |
		self lookUpInGlobals: object ]