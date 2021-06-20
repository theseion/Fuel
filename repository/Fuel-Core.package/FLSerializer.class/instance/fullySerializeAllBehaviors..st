configuring-globals
fullySerializeAllBehaviors: aCollection
	aCollection isCollection ifFalse: [
		FLConfigurationError signal: 'Argument must be a collection' ].
	
	aCollection do: [ :behavior |
		self fullySerializeBehavior: behavior ]