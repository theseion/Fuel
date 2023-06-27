initialization
initialize
	super initialize.
	
	stream := self context stream.
	globalEnvironment := self configuration environment.
	self initializeMigrations