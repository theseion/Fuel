accessing-files
readStreamForFilePath: aString
	^ (File named: (self filePathString: aString)) readStream
		  binary;
		  yourself