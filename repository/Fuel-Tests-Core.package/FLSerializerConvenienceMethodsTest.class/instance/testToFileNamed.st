tests
testToFileNamed
	| object filePath materialized |
	object := FLPair new
		left: 'a';
		right: 'b';
		yourself.
	filePath := FLFilePoolTestResource current filePathString: 'someFile'.
	self serializer class
		serialize: object
		toFileNamed: filePath.
	materialized := self materializer
		filePath: filePath;
		materializeRoot.
	
	self assert: object equals: materialized