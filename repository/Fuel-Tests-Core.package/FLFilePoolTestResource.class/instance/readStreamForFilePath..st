accessing-files
readStreamForFilePath: aString
	^ FLPlatform current readStreamForFilePath: (FLPlatform current
		joinPath: directoryPath
		with: aString)