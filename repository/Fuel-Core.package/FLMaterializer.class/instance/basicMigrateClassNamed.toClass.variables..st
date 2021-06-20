private
basicMigrateClassNamed: aSymbol toClass: aClass variables: aDictionary
	self
		validateMigrationFrom: aSymbol
		to: aClass.
	
	self migrations add: (FLMigration 
		fromClassNamed: aSymbol 
		toClass: aClass
		variables: aDictionary)