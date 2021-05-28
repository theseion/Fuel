running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	encoder := FLEncoder
		on: stream
		globalEnvironment: self class environment.
	
	decoder := FLDecoder
		on: stream
		migrations: #()
		globalEnvironment: self class environment
	