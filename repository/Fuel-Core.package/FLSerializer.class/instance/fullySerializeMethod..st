configuring-globals
fullySerializeMethod: aCompiledMethod
	aCompiledMethod isCompiledMethod ifFalse: [
		FLConfigurationError signal: 'Argument must be a CompiledMethod' ].
	
	self methodsToSerialize add: aCompiledMethod
		