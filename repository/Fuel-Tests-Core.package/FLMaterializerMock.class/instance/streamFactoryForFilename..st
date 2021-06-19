private
streamFactoryForFilename: aString
	^ [ FLFilePoolTestResource current readStreamForFilePath: aString ]