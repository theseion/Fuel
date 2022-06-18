convenience
materializeHeaderFromFileNamed: aFilePath
	^ self new
		filePath: aFilePath;
		materializeHeader