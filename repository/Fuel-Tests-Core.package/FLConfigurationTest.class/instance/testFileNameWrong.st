tests-configuring-convenience
testFileNameWrong
	 self
		should: [ self serializer fileName: 'filename' asFileReference ]
		raise: FLConfigurationError.
	self
		shouldnt: [ self serializer fileName: 'filename' ]
		raise: FLConfigurationError.
	self
		shouldnt: [ self serializer fileName: 'filename' asSymbol ]
		raise: FLConfigurationError