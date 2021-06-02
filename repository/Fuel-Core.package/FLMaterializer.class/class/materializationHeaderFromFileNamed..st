materializing-shortcuts
materializationHeaderFromFileNamed: aFilename

	^ FLPlatform current
		fileNamed: aFilename 
		readStreamDo: [ :aFileStream | 
			self new materializeHeaderFrom: aFileStream ]
