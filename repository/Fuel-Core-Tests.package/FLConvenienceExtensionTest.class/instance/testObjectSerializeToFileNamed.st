tests
testObjectSerializeToFileNamed
	| filePath object materializedObject |
	filePath := FLFilePoolTestResource current filePathString: 'test.fuel'.
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	object serializeToFileNamed: filePath.
	
	materializedObject := FLMaterializer new
		filePath: filePath;
		materializeRoot.
		
	self assert: materializedObject equals: object.
	self deny: materializedObject identicalTo: object