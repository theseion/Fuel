testing
fileExists: aString
	^ FLPlatform current filePathExists: (self filePathString: aString)