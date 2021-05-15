running
setUp
	super setUp.
	
	stream := WriteStream on: ByteArray new.
	encoder := FLEncoder
		on: stream
		globalEnvironment: self class environment