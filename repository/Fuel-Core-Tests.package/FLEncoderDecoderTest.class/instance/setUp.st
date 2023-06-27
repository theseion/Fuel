running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	FLSerializer new
		streamFactory: [ stream ];
		useDuring: [ encoder := FLEncoder new ].
	
	FLMaterializer new
		streamFactory: [ stream ];
		useDuring: [ decoder := FLDecoder new ]