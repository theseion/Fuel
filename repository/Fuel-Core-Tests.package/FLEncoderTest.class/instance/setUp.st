running
setUp
	super setUp.
	
	stream := WriteStream on: ByteArray new.
	FLSerializer new
		streamFactory: [ stream ];
		useDuring: [ encoder := FLEncoder new ]