tests-configuring-convenience
testOnStreamWrong
	 self
		should: [ self serializer onStream: 'filename' ]
		raise: FLConfigurationError.
		
	self
		should: [ self serializer onStream: nil ]
		raise: FLConfigurationError