configuring-migrations
migrateClassNamed: aSymbol toClass: aClassOrSymbol
	"Use aClassOrSymbol instead of aSymbol after materialization. This only changes the class name.
	The target class is expected to exist in the target system's global environment.
	Variables are expected to be unchanged. Extra variables will be nil, missing variables will
	be ignored.
	Example (change name of class #MyPoint to #YourPoint):
		configuration
			migrateClassNamed: #MyPoint
			toClass: #YourPoint }"

	self
		migrateClassNamed: aSymbol
		toClass: aClassOrSymbol
		variables: Dictionary new