tests-configuring-globals
testFullySerializeAllBehaviorsMustBeCollection
	{
		Object.
		Object new.
		nil.
		true.
		[ :x ] } do: [ :object |
			self
				should: [ self serializer fullySerializeAllBehaviors: object ]
				raise: FLConfigurationError ].
		
	self
		shouldnt: [ self serializer fullySerializeAllBehaviors: Array new ]
		raise: FLConfigurationError