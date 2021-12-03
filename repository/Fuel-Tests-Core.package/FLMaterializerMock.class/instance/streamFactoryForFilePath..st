private
streamFactoryForFilePath: aString
	^ [ FLFilePoolTestResource current readStreamForFilePath: aString ]