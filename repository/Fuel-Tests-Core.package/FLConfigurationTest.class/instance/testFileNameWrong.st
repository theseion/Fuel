tests
testFileNameWrong
	 self
		should: [ FLSerializer new fileName: 'filename' asFileReference ]
		raise: FLConfigurationError.
	self
		shouldnt: [ FLSerializer new fileName: 'filename' ]
		raise: FLConfigurationError.
	self
		shouldnt: [ FLSerializer new fileName: 'filename' asSymbol ]
		raise: FLConfigurationError