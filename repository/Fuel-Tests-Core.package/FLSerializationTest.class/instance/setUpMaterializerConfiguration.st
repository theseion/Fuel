running
setUpMaterializerConfiguration
	materializerConfiguration := FLMaterializerMock new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy readStream ]
		yourself