running
setUpMaterializerConfiguration
	materializerConfiguration := FLMaterializerConfiguration new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy readStream ]
		yourself