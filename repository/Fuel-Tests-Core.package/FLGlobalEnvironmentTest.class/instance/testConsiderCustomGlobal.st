tests
testConsiderCustomGlobal
	"A custom global variable is treated as global if we explicitly specify that on serialization."
	
	self analyzer considerGlobal: #FLGlobalVariableForTesting.

	self analyzer globalEnvironment: (Dictionary new
		at: #FLGlobalVariableForTesting put: 42;
		yourself).

	self materializer globalEnvironment: (Dictionary new
		at: #FLGlobalVariableForTesting put: 7;
		yourself).
	
	self assert: (self resultOfSerializeAndMaterialize: 42) equals: 7