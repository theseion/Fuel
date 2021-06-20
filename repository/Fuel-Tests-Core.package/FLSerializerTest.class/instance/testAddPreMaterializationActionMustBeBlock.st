tests-configuring-materialization
testAddPreMaterializationActionMustBeBlock
	{
		Object.
		Object new.
		Object>>#=.
		nil.
		true
	} do: [ :object |
		self
			should: [ self serializer addPreMaterializationAction: object ]
			raise: FLConfigurationError ].
		
	self
		shouldnt: [ self serializer addPreMaterializationAction: [] ]
		raise: FLConfigurationError