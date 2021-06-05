accessing
new
	self == FLConfiguration ifTrue: [
		FLConfigurationError signal: 'Use one of my subclasses' ].
	
	^ super new