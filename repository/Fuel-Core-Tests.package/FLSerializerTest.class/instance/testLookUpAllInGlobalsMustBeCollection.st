tests-configuring-globals
testLookUpAllInGlobalsMustBeCollection
	{
		Object.
		Object new.
		nil.
		true.
		[ :x ] } do: [ :object |
			self
				should: [ self serializer lookUpAllInGlobals: object ]
				raise: FLConfigurationError ].
		
	self
		shouldnt: [ self serializer lookUpAllInGlobals: Array new ]
		raise: FLConfigurationError