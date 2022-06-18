convenience
serialize: anObject toFileNamed: aFilePath
	self new
		object: anObject;
		filePath: aFilePath;
		serialize