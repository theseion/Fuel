tests
testObjectCollectionMustBeCollection
	{
		Object new.
		Object.
		WriteStream basicNew.
		ReadStream basicNew
	} do: [ :object |
		self
			should: [ FLSerializer new objectCollection: object ]
			raise: FLConfigurationError ].
	
	
	{
		Array new: 0.
		OrderedCollection new.
		Set new.
		Bag new
	} do: [ :collection |
		self
			shouldnt: [ FLSerializer new objectCollection: collection ]
			raise: FLConfigurationError ]