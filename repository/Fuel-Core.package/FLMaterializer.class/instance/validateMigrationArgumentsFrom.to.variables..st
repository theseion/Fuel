private
validateMigrationArgumentsFrom: aSymbol to: aClassOrSymbol variables: aDictionary
	aSymbol isString ifFalse: [
		FLConfigurationError signal: 'Source must be a symbol' ].
	
	(aClassOrSymbol isString or: [
		aClassOrSymbol isClass ]) ifFalse: [
			FLConfigurationError signal: 'Target must be a class or symbol' ].
		
	aDictionary isDictionary ifFalse: [
		FLConfigurationError signal: 'Variable map must be a dictionary' ]