configuring-globals
fullySerializeAllMethods: aCollection
	aCollection isCollection ifFalse: [
		FLConfigurationError signal: 'Argument must be a collection' ].
	
	aCollection do: [ :behavior |
		self fullySerializeMethod: behavior ]