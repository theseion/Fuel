running
setUpSerializerConfiguration
	serializerConfiguration := FLSerializerMock new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy writeStream ]
		yourself