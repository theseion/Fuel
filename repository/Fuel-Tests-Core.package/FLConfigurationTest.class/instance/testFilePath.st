tests-configuring-convenience
testFilePath
	| fileName materialized |
	fileName := 'test_file_name'.
	self serializer
		filePath: fileName;
		object: 'abc'.
	
	self deny: (FLFilePoolTestResource current fileExists: fileName).
	self serializer serialize.
	
	self assert: (FLFilePoolTestResource current fileExists: fileName).
	
	materialized := self materializer
		filePath: fileName;
		materializeRoot.
	self assert: materialized equals: 'abc'