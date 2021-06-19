accessing-files
writeStreamForFilePath: aString
	^ FLPlatform current writeStreamForFilePath: (FLPlatform current
		joinPath: directoryPath
		with: aString)