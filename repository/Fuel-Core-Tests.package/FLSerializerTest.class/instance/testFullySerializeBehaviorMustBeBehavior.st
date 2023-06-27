tests-configuring-globals
testFullySerializeBehaviorMustBeBehavior
	{
		Object new.
		nil.
		true.
		[ :x ] } do: [ :object |
			self
				should: [ self serializer fullySerializeBehavior: object ]
				raise: FLConfigurationError ].
	
	self
		shouldnt: [ self serializer fullySerializeBehavior: Object ]
		raise: FLConfigurationError.
		
	self
		shouldnt: [ self serializer fullySerializeBehavior: self classFactory silentlyNewTrait ]
		raise: FLConfigurationError