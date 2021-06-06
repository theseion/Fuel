running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	FLMaterializerConfiguration new
		streamFactory: [ stream ];
		useDuring: [ decoder := FLDecoder new ]