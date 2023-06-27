running
setUpMaterializer
	materializer := FLMaterializerMock new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy readStream ]
		yourself