tests
testDontConsiderCustomGlobal
	"A custom global variable is not treated as global unless we explicitly specify during serialization."

	| anObject |
	anObject := Object new.
	self analyzer globalEnvironment: (Dictionary new
		at: #FLGlobalVariableForTesting put: anObject;
		at: #Object put: Object;
		yourself).
	self materializer globalEnvironment: (Dictionary new
		at: #FLGlobalVariableForTesting put: anObject;
		at: #Object put: Object;
		yourself).

	self deny: (self analyzer globalSymbols includes: #FLGlobalVariableForTesting).
	self deny: (self resultOfSerializeAndMaterialize: anObject) identicalTo: anObject