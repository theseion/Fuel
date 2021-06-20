tests-configuring-globals
testFullySerializeAllMethodsMustBeCollection
	{
		Object.
		Object new.
		nil.
		true.
		[ :x ] } do: [ :object |
			self
				should: [ self serializer fullySerializeAllMethods: object ]
				raise: FLConfigurationError ].
		
	self
		shouldnt: [ self serializer fullySerializeAllMethods: Array new ]
		raise: FLConfigurationError