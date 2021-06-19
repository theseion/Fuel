configuring-convenience
fileName: aString
	"Takes the name of the file that should be used for the file produced during serialization.
	The filename should be passed without any extension, which can be specified separately
	via #fileExtension:"

	aString isString ifFalse: [ FLConfigurationError signal: 'The file name can only be a string.' ].
	
	self streamFactory: (self streamFactoryForFilename: aString)