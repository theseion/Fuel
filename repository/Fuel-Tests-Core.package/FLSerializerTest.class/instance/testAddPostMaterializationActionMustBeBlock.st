tests-configuring-materialization
testAddPostMaterializationActionMustBeBlock
	{
		Object.
		Object new.
		Object>>#=.
		nil.
		true
	} do: [ :object |
		self
			should: [ self serializer addPostMaterializationAction: object ]
			raise: FLConfigurationError ].
		
	self
		shouldnt: [ self serializer addPostMaterializationAction: [] ]
		raise: FLConfigurationError