tests
testDontConsiderCustomGlobal
	"A custom global variable is not treated as global unless we explicitly specify during serialization."

	| anObject |
	anObject := Object new.
	self serializer
		environment: (Dictionary new
			at: #FLGlobalVariableForTesting put: anObject;
			at: #Object put: Object;
			yourself);
		environment: (Dictionary new
			at: #FLGlobalVariableForTesting put: anObject;
			at: #Object put: Object;
			yourself).

	self deny: (self serializer globalSymbols includes: #FLGlobalVariableForTesting).
	self deny: (self resultOfSerializeAndMaterialize: anObject) identicalTo: anObject