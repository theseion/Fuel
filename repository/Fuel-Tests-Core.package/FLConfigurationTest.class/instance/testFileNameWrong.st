tests
testFileNameWrong
	 self
		should: [ FLSerializerConfiguration new fileName: 'filename' asFileReference ]
		raise: FLConfigurationError.
	self
		shouldnt: [ FLSerializerConfiguration new fileName: 'filename' ]
		raise: FLConfigurationError.
	self
		shouldnt: [ FLSerializerConfiguration new fileName: 'filename' asSymbol ]
		raise: FLConfigurationError