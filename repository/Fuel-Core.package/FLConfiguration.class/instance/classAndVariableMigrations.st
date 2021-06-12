enumerating
classAndVariableMigrations
	^ map 
		at: #classAndVariableMigrations
		ifAbsent: [ Dictionary new ]