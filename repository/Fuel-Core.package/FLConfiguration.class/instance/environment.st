configuring
environment
	^ map
		at: #environment
		ifAbsentPut: [ self class defaultGlobalEnvironment ]