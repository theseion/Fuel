tests-Managing Globals
testConsiderGlobal
	
	| anArray materializedArray |
	"Prepare an array whose two elements are system globals."
	anArray := Array with: Set new with: Set new.
	self environmentOfTest
		at: #GlobalSet1 put: anArray first;
		at: #GlobalSet2 put: anArray second.

	"Serialize considering *only first* as a global object."
	FLSerializer new
		fileName: 'demo.fuel';
		environment: self environmentOfTest;
		considerGlobal: #GlobalSet1;
		object: anArray;
		serialize.

	"Materialize"
	materializedArray := FLMaterializer new
		fileName: 'demo.fuel';
		environment: self environmentOfTest;
		materialize.
				
	"Check that second element is a new Set."
	self assert: (self environmentOfTest at: #GlobalSet1) identicalTo: materializedArray first.
	self deny: (self environmentOfTest at: #GlobalSet2) identicalTo: materializedArray second