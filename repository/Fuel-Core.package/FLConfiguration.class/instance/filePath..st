configuring-convenience
filePath: aString
	"Takes the path to the file that should be used for serializing or materializing data.
	The path must be a string and may be relative."

	aString isString ifFalse: [ FLConfigurationError signal: 'The file path can only be a string.' ].
	
	self streamFactory: (self streamFactoryForFilePath: aString)