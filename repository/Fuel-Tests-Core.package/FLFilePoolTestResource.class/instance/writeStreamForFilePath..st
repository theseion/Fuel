accessing-files
writeStreamForFilePath: aString
	^ FLPlatform current writeStreamForFilePath: (self filePathString: aString)