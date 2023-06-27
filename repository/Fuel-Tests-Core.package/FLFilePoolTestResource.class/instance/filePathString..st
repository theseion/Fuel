accessing-files
filePathString: aString
	^ (directoryPath asFileReference / aString) pathString