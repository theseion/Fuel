running
setUpSerializerConfiguration
	serializerConfiguration := FLSerializerConfiguration new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy writeStream ]
		yourself