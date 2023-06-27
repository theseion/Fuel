private
streamFactoryForFilePath: aString
	^ [ FLFilePoolTestResource current writeStreamForFilePath: aString ]