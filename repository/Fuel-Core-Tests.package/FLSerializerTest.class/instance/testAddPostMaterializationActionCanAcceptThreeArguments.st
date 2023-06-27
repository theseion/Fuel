tests-configuring-materialization
testAddPostMaterializationActionCanAcceptThreeArguments
	{
		[].
		[ :a ].
		[ :a :b ].
		[ :a :b :c ]
	} do: [ :block |
		self
			shouldnt: [ self serializer addPostMaterializationAction: block ]
			raise: FLConfigurationError ].
		
	self
		should: [ self serializer addPostMaterializationAction: [ :a :b :c :d ] ]
		raise: FLConfigurationError