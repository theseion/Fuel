tests
testWhenSubstituteByMustBeBlocks
	{
		Object -> [ :x ].
		Object new -> [ :x ].
		(Array new: 0) -> [ :x ].
		(1 -> 2) -> (1 -> 2)
	} do: [ :assoc |
		self
			should: [
				self serializer
					when: assoc key
					substituteBy: assoc value ]
			raise: FLConfigurationError.
		self
			should: [
				self serializer
					when: assoc value
					substituteBy: assoc key ]
			raise: FLConfigurationError ].
	
	self
		shouldnt: [
			self serializer
				when: [ :x ]
				substituteBy: [ :x ] ]
		raise: FLConfigurationError