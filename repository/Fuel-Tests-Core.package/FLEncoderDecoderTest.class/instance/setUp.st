running
setUp
	super setUp.
	
	stream := ReadWriteStream on: ByteArray new.
	FLSerializerConfiguration new
		streamFactory: [ stream ];
		useDuring: [ encoder := FLEncoder new ].
	
	FLMaterializerConfiguration new
		streamFactory: [ stream ];
		useDuring: [ decoder := FLDecoder new ]