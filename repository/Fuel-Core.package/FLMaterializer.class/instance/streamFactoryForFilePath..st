private
streamFactoryForFilePath: aString
	^ [ FLPlatform current readStreamForFilePath: aString ]