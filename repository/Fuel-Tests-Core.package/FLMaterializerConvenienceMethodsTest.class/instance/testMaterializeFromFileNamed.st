tests
testMaterializeFromFileNamed
	| filePath object materialized |
	filePath := FLFilePoolTestResource current filePathString: 'afile.fuel'.
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	self serializer
		filePath: filePath;
		object: object;
		serialize.
	materialized := self materializer class materializeFromFileNamed: filePath.
	
	self assert: object equals: materialized