tests-configuring-materialization
testAddPreMaterializationActionMustBeCleanBlock
	self
		should: [ self serializer addPreMaterializationAction: [ self ] ]
		raise: FLConfigurationError.
		
	self
		shouldnt: [ self serializer addPreMaterializationAction: [ Smalltalk ] ]
		raise: FLConfigurationError