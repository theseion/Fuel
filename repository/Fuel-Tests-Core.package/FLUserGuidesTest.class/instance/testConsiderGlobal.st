tests-Managing Globals
testConsiderGlobal
	
	| aSerializer anArray materializedArray |
	"Prepare an array whose two elements are system globals."
	anArray := Array with: Set new with: Set new.
	testingEnvironment at: #GlobalSet1 put: anArray first.
	testingEnvironment at: #GlobalSet2 put: anArray second.

	"Serialize considering *only first* as a global object."
	FLPlatform current
		fileNamed: 'demo.fuel'
		writeStreamDo: [ :aStream |
			aSerializer := FLSerializer newDefault.
			aSerializer analyzer considerGlobal: #GlobalSet1.
			aSerializer serialize: anArray on: aStream ].

	"Materialize"
	materializedArray := FLPlatform current
		fileNamed: 'demo.fuel'
		readStreamDo: [:aStream |
			(FLMaterializer newDefault 
				materializeFrom: aStream) root].
				
	"Check that second element is a new Set."
	[ (testingEnvironment at: #GlobalSet1) == materializedArray first ] assert.
	[ (testingEnvironment at: #GlobalSet2) ~~ materializedArray second ] assert