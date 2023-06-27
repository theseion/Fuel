tests-configuring-materialization
testAddPreMaterializationActionCanAcceptTwoArguments
	{
		[].
		[ :a ].
		[ :a :b ]
	} do: [ :block |
		self
			shouldnt: [ self serializer addPreMaterializationAction: block ]
			raise: FLConfigurationError ].
		
	self
		should: [ self serializer addPreMaterializationAction: [ :a :b :c ] ]
		raise: FLConfigurationError