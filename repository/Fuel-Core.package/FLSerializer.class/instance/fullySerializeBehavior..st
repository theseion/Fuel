configuring-globals
fullySerializeBehavior: aBehavior
	aBehavior isBehavior ifFalse: [
		FLConfigurationError signal: 'Argument must be a Behavior' ].
	
	self behaviorsToSerialize add: aBehavior
		