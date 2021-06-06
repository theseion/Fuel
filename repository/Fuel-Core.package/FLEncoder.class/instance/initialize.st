initialization
initialize
	super initialize.
	
	stream := FLBufferedWriteStream on: self context stream.
	globalEnvironment := self configuration environment.
	self context registerFinalizer: [ self flush ]