configuring
streamFactoryForFilename: aString
	^ [ FLPlatform current writeStreamForFileNamed: aString ]