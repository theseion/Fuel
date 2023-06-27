running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	FLMaterializer new
		streamFactory: [ stream ];
		useDuring: [ decoder := FLDecoder new ]