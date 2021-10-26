configuring
object: anObject
	map
		at: #object
		ifPresent: [ :object | FLConfigurationError signal: 'Object already set' ]
		ifAbsentPut: [ anObject ]