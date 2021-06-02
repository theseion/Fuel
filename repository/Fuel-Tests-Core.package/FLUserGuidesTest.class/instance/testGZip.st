tests-Getting Started
testGZip
	| materialized |
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo: [ :aFileStream | 
			| gzip |
			gzip := GZipWriteStream on: aFileStream.
			FLSerializer serialize: 123 on: gzip.
			gzip finish ].
	materialized := FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo: [ :aFileStream | 
			| gzip |
			gzip := GZipReadStream on: aFileStream.
			(FLMaterializer new materializeFrom: gzip) root ].
	self assert: materialized equals: 123