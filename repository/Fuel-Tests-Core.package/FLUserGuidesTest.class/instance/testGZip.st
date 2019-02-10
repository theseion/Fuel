tests-Getting Started
testGZip
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo: [ :aFileStream |
			|gzip|
			gzip := GZipWriteStream on: aFileStream.
			FLSerializer newDefault serialize: 123 on: gzip.
			gzip finish. ].
	
	FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo: [:aFileStream | 
			|gzip|
			gzip := GZipReadStream on: aFileStream.		
			FLMaterializer newDefault 
				materializeFrom: gzip ]