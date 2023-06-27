tests-Managing Globals
testConsiderGlobal
	
	| anArray materialized |
	"Prepare an array whose two elements are system globals."
	anArray := Array with: Set new with: Set new.
	self environmentOfTest
		at: #GlobalSet1 put: anArray first;
		at: #GlobalSet2 put: anArray second.

	"Serialize considering *only first* as a global object."
	FLSerializer new
		filePath: 'demo.fuel';
		environment: self environmentOfTest;
		lookUpInGlobals: #GlobalSet1;
		object: anArray;
		serialize.

	"Materialize"
	materialized := FLMaterializer new
		filePath: 'demo.fuel';
		environment: self environmentOfTest;
		materializeRoot.
				
	"Check that second element is a new Set."
	self assert: (self environmentOfTest at: #GlobalSet1) identicalTo: materialized first.
	self deny: (self environmentOfTest at: #GlobalSet2) identicalTo: materialized second