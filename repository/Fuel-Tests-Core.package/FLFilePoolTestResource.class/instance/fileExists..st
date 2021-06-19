testing
fileExists: aFileName
	^ FLPlatform current filePathExists: (FLPlatform current
		joinPath: directoryPath
		with: aFileName)