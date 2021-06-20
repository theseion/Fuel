tests-configuring-materialization
testAddPostMaterializationActionMustBeCleanBlock
	self
		should: [ self serializer addPostMaterializationAction: [ self ] ]
		raise: FLConfigurationError.
		
	self
		shouldnt: [ self serializer addPostMaterializationAction: [ Smalltalk ] ]
		raise: FLConfigurationError