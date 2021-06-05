configuring
streamFactoryForFilename: aString
	^ [ FLPlatform current readStreamForFileNamed: aString ]