tests-configuring-stream
testStreamFactory
	| string |
	string := String new: 3.
	serializer := FLSerializer new
		streamFactory: [ string writeStream ];
		yourself.
	materializer := FLMaterializer new
		streamFactory: [ string readStream ];
		yourself.
	
	serializer streamFactory value nextPutAll: 'foo'.
	self assert: string equals: 'foo'.
	
	self assert: materializer streamFactory value upToEnd equals: 'foo'