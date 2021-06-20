configuring-migrations
migrateClassNamed: aSymbol toClass: aClassOrSymbol variables: aDictionary
	"Use aClassOrSymbol instead of aSymbol after materialization and migrate variable names as defined in 
	aDictionary. The new class is expected to exist in the target system's global environment.
	Variables are expected to be unchanged with exception to those in aDictionary. Extra variables will 
	be nil, missing variables will be ignored.
	Example (change class name from #MyPoint to #YourPoint and change name of variable 'x' to 'xCoordinate'):
		configuration
			migrateClassNamed: #MyPoint
			toClass: #YourPoint
			variables: { x -> xCoordinate }"

	| class |
	self
		validateMigrationArgumentsFrom: aSymbol
		to: aClassOrSymbol
		variables: aDictionary.
	
	class := aClassOrSymbol isString
		ifTrue: [
			self environment
				at: aClassOrSymbol asSymbol
				ifPresent: [ :global |
					global isClass
						ifTrue: [ global ]
						ifFalse: [
							FLConfigurationError signal: 'Target global must be a class' ] ]
				ifAbsent: [
					FLConfigurationError signal: 'Global not found: ', aClassOrSymbol ] ]
		ifFalse: [ aClassOrSymbol ].
	
	self
		basicMigrateClassNamed: aSymbol asSymbol
		toClass: class
		variables: aDictionary