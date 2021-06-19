private
streamFactoryForFilename: aString
	^ [ FLFilePoolTestResource current writeStreamForFilePath: aString ]