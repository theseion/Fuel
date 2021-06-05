tests
testConsiderCustomGlobal
	"A custom global variable is treated as global if we explicitly specify that on serialization."
	
	self serializerConfig
		considerGlobal: #FLGlobalVariableForTesting;
		environment: (Dictionary new
			at: #FLGlobalVariableForTesting put: 42;
			yourself).

	self materializerConfig environment: (Dictionary new
		at: #FLGlobalVariableForTesting put: 7;
		yourself).
	
	self assert: (self resultOfSerializeAndMaterialize: 42) equals: 7