materializing-shortcuts
materializationFromFileNamed: aFilename
	^ FLPlatform current
		fileNamed: aFilename 
		readStreamDo: [ :aFileStream | 
			self new materializeFrom: aFileStream ]
