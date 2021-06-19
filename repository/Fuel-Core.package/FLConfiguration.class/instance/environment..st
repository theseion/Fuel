configuring
environment: anEnvironment
	map
		at: #environment
		ifPresent: [ FLConfigurationError signal: 'Environment already set' ]
		ifAbsentPut: [ anEnvironment ].
	
	"We at least need the UndefinedObject class in case we substitute an object with nil
	and serialize the class in an environment without nil"
	anEnvironment
		at: #UndefinedObject
		ifAbsentPut: [ self class environment at: #UndefinedObject ]