private
streamFactoryForFilename: aString
	^ [ FLPlatform current readStreamForFilePath: aString ]