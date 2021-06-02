tests-Managing Globals
testConsiderGlobal
	
	| aSerializer anArray materializedArray |
	"Prepare an array whose two elements are system globals."
	anArray := Array with: Set new with: Set new.
	self environmentOfTest
		at: #GlobalSet1 put: anArray first;
		at: #GlobalSet2 put: anArray second.

	"Serialize considering *only first* as a global object."
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo: [ :aStream |
			aSerializer := FLSerializer new.
			aSerializer analyzer
				globalEnvironment: self environmentOfTest;
				considerGlobal: #GlobalSet1.
			aSerializer serialize: anArray on: aStream ].

	"Materialize"
	materializedArray := FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo: [:aStream |
			(FLMaterializer new
				globalEnvironment: self environmentOfTest;
				materializeFrom: aStream) root].
				
	"Check that second element is a new Set."
	self assert: (self environmentOfTest at: #GlobalSet1) identicalTo: materializedArray first.
	self deny: (self environmentOfTest at: #GlobalSet2) identicalTo: materializedArray second