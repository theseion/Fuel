tests-configuring-convenience
testFileName
	| fileName materialized |
	fileName := 'test_file_name'.
	self serializer
		fileName: fileName;
		object: 'abc'.
	
	self deny: (FLFilePoolTestResource current fileExists: fileName).
	self serializer serialize.
	
	self assert: (FLFilePoolTestResource current fileExists: fileName).
	
	materialized := self materializer
		fileName: fileName;
		materializeRoot.
	self assert: materialized equals: 'abc'
	