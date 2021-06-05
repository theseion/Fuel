enumerating
classAndVariableMigrations
	^ self 
		at: #classAndVariableMigrations
		ifAbsent: [ Dictionary new ]