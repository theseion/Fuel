tests
testObjectSerializeOn
	| filePath object byteArray materializedObject |
	filePath := FLFilePoolTestResource current filePathString: 'test.fuel'.
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	byteArray := ByteArray streamContents: [ :stream |
		object serializeOn: stream ].
	
	materializedObject := FLMaterializer new
		onStream: byteArray readStream;
		materializeRoot.
		
	self assert: materializedObject equals: object.
	self deny: materializedObject identicalTo: object