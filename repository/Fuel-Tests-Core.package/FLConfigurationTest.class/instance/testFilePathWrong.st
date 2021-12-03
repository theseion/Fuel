tests-configuring-convenience
testFilePathWrong
	 self
		should: [ self serializer filePath: 'filename' asFileReference ]
		raise: FLConfigurationError.
	self
		shouldnt: [ self serializer filePath: 'filename' ]
		raise: FLConfigurationError.
	self
		shouldnt: [ self serializer filePath: 'filename' asSymbol ]
		raise: FLConfigurationError