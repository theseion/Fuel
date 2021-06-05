configuring
environment
	^ self
		at: #environment
		ifAbsentPut: [ self class defaultGlobalEnvironment ]