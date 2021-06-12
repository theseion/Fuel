running
setUpSerializerConfiguration
	serializerConfiguration := FLSerializerConfigurationMock new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy writeStream ]
		yourself