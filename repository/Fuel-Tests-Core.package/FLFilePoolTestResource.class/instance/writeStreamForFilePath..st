accessing-files
writeStreamForFilePath: aString
	^ (File named: (self filePathString: aString)) writeStream
		  binary;
		  yourself