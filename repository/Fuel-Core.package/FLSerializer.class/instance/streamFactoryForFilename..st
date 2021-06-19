private
streamFactoryForFilename: aString
	^ [ FLPlatform current writeStreamForFilePath: aString ]