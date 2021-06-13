tests
testConsiderCustomGlobal
	"A custom global variable is treated as global if we explicitly specify that on serialization."
	
	self serializer
		considerGlobal: #FLGlobalVariableForTesting;
		environment: (Dictionary new
			at: #FLGlobalVariableForTesting put: 42;
			yourself).

	self materializer environment: (Dictionary new
		at: #FLGlobalVariableForTesting put: 7;
		yourself).
	
	self assert: (self resultOfSerializeAndMaterialize: 42) equals: 7