running
setUp
	super setUp.
	
	stream := WriteStream on: ByteArray new.
	FLSerializerConfiguration new
		streamFactory: [ stream ];
		useDuring: [ encoder := FLEncoder new ]