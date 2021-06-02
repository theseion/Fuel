running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	decoder := FLDecoder
		on: stream
		migrations: #()
		globalEnvironment: self environmentOfTest