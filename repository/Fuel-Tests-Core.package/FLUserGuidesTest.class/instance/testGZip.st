tests-Getting Started
testGZip
	| materialized |
	FLSerializer new
		fileName: 'demo.fuel';
		decorateStreamFactory: [ :fileStream | GZipWriteStream on: fileStream ];
		streamFinalizer: [ :gzipStream | gzipStream close ];
		object: 123;
		serialize.
	materialized := FLMaterializer new
		fileName: 'demo.fuel';
		decorateStreamFactory: [ :fileStream | GZipReadStream on: fileStream ];
		materializeRoot.
	self assert: materialized equals: 123