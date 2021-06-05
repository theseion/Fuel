tests-Getting Started
testGZip
	| materialized |
	FLSerializerConfiguration new
		fileName: 'demo';
		decorateStreamFactory: [ :fileStream | GZipWriteStream on: fileStream ];
		streamFinalizer: [ :gzipStream | gzipStream finish ];
		object: 123;
		serialize.
	materialized := FLMaterializerConfiguration new
		fileName: 'demo';
		decorateStreamFactory: [ :fileStream | GZipReadStream on: fileStream ];
		materialize.
	self assert: materialized equals: 123