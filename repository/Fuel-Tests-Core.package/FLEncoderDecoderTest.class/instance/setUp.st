running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	encoder := FLEncoder
		on: stream
		globalEnvironment: self environmentOfTest.
	
	decoder := FLDecoder
		on: stream
		migrations: #()
		globalEnvironment: self environmentOfTest
	