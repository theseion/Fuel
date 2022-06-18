tests
testMaterializeHeaderFromFileNamed
	| filePath object materialized |
	filePath := FLFilePoolTestResource current filePathString: 'afile.fuel'.
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	self serializer
		at: #homer putAdditionalObject: 'simpson';
		filePath: filePath;
		object: object;
		serialize.
	materialized := self materializer class materializeHeaderFromFileNamed: filePath.
	
	self assert: materialized class equals: FLHeader.
	self assert: (materialized additionalObjectAt: #homer) equals: 'simpson'