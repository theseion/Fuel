initializing
initialize
	super initialize.
	
	stream := self context stream.
	migrations := self configuration migrations.
	globalEnvironment := self configuration environment