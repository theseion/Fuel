accessing-files
readStreamForFilePath: aString
	^ FLPlatform current readStreamForFilePath: (self filePathString: aString)