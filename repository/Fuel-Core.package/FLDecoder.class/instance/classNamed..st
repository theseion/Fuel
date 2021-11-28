accessing
classNamed: className
	^ migrationsBySource
		at: className
		ifPresent: [ :migration | migration targetClass ]
		ifAbsent: [ self globalClassNamed: className ]