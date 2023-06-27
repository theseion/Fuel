running
setUpSerializer
	serializer := FLSerializerMock new
		environment: self environmentOfTest;
		streamFactory: [ streamStrategy writeStream ]
		yourself