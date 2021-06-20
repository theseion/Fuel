tests-configuring
testWhenSubstituteByMustAcceptSingleArgument
	{
		[].
		[ :a :b ].
		[ :a :b :c ]
	} do: [ :block |
		self
			should: [
				self serializer
					when: [ :x ]
					substituteBy: block ]
			raise: FLConfigurationError.
		self
			should: [
				self serializer
					when: block
					substituteBy: [ :x ] ]
			raise: FLConfigurationError ].
		
	self
		shouldnt: [
			self serializer
				when: [ :x ]
				substituteBy: [ :y ] ]
		raise: FLConfigurationError
