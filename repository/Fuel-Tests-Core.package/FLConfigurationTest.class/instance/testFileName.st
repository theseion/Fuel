tests
testFileName
	| fileName serializerConfiguration materialized |
	fileName := 'test_file_name'.
	serializerConfiguration := FLSerializer new
		fileName: fileName;
		object: 'abc';
		yourself.
	self markFileForDeletion: fileName asFileReference.
	
	self deny: fileName asFileReference exists.
	serializerConfiguration serialize.
	
	self assert: fileName asFileReference exists.
	
	materialized := FLMaterializer new
		fileName: fileName;
		materialize.
	self assert: materialized equals: 'abc'
	