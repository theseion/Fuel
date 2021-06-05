tests
testConsiderCustomGlobalNotFound
	"A custom global variable is treated as global if we explicitly specify that on serialization. Then, if the variable is not defined in the materialization environment, a error should be raised."
	
	self serializerConfig
		considerGlobal: #FLGlobalVariableForTesting;
		environment: (Dictionary new
			at: #FLGlobalVariableForTesting put: 42;
			yourself).
	self materializerConfig environment: Dictionary new.

	self serialize: 42.
	self 
		should: [ self materialization ] 
		raise: FLGlobalNotFound 
		description: 'Raise an error since the variable is not present in materialization global environment'