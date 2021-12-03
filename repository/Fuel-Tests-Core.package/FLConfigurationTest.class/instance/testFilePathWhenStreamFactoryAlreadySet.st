tests-configuring-convenience
testFilePathWhenStreamFactoryAlreadySet
	serializer := FLSerializer new
		filePath: 'filename';
		yourself.
	 self
		should: [ serializer filePath: 'filename' ]
		raise: FLConfigurationError