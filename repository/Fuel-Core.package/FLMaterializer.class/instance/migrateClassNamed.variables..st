as yet unclassified
migrateClassNamed: aSymbol variables: aDictionary
	"Migrates variable names as defined in aDictionary.
	Variables are expected to be unchanged with exception to those in aDictionary. Extra variables will 
	be nil, missing variables will be ignored.
	Example (change name of variable 'x' to 'xCoordinate'):
		configuration
			migrateClassNamed: #MyPoint
			variables: { x -> xCoordinate }"
	
	self
		migrateClassNamed: aSymbol
		toClass: aSymbol
		variables: aDictionary