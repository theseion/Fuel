private
streamFactoryForFilename: aString
	^ [ FLPlatform current readStreamForFileNamed: aString ]