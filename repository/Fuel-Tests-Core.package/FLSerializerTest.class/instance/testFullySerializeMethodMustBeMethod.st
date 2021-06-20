tests-configuring-globals
testFullySerializeMethodMustBeMethod
	{
		Object new.
		nil.
		true.
		[ :x ] } do: [ :object |
			self
				should: [ self serializer fullySerializeMethod: object ]
				raise: FLConfigurationError ].
	
	self
		shouldnt: [ self serializer fullySerializeMethod: Object>>#= ]
		raise: FLConfigurationError