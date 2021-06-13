private
streamFactoryForFilename: aString
	^ [ FLPlatform current writeStreamForFileNamed: aString ]