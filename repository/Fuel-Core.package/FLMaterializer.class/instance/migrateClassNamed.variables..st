configuring-migration
migrateClassNamed: aSymbol variables: aDictionary 
	self 
		migrateClassNamed: aSymbol 
		toClass: (self globalEnvironment at: aSymbol)
		variables: aDictionary