private
validateMigrationFrom: aSymbol to: aClass
	aSymbol isString ifFalse: [
		FLConfigurationError signal: 'Source class name must be a symbol' ].
		
	self migrations
		detect: [ :migration | migration sourceClassName = aSymbol ]
		ifNone: [ ^ self ].
		
	FLConfigurationError signal: 'Existing migration for ', aSymbol, ' found.',
		' You can''t register more than one migration for every source class'