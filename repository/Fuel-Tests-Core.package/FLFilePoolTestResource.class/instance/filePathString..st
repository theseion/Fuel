accessing-files
filePathString: aString
	^ FLPlatform current
		joinPath: directoryPath
		with: aString