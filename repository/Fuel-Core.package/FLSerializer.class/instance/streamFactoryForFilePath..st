private
streamFactoryForFilePath: aString
	^ [ FLPlatform current writeStreamForFilePath: aString ]