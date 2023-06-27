private
streamFactoryForFilePath: aString
	^ [
	  (File named: aString) readStream
		  binary;
		  yourself ]