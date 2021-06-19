configuring
object: anObject
	map
		at: #object
		ifPresent: [ FLConfigurationError signal: 'Object already set' ]
		ifAbsentPut: [ anObject ]