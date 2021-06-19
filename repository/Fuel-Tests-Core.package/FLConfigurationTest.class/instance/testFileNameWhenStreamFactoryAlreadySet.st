tests-configuring-convenience
testFileNameWhenStreamFactoryAlreadySet
	serializer := FLSerializer new
		fileName: 'filename';
		yourself.
	 self
		should: [ serializer fileName: 'filename' ]
		raise: FLConfigurationError