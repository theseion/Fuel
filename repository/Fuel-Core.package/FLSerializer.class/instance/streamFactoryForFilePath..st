private
streamFactoryForFilePath: aString
	^ [
	  (File named: aString) writeStream
		  binary;
		  yourself ]