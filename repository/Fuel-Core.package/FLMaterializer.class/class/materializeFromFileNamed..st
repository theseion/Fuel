convenience
materializeFromFileNamed: aFilePath
	^ self new
		filePath: aFilePath;
		materializeRoot
