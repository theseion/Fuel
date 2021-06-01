tests
testGlobalMetaclass
	"A metaclass should be global by default. On materialization, the global symbol should be found in the global environment."

	self materializer globalEnvironment: (Dictionary new
		at: #Integer put: FLPerson;
		yourself).

	self assert: (self resultOfSerializeAndMaterialize: Integer class) identicalTo: FLPerson class