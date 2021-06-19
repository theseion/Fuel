tests-configuring-stream
testStreamFinalizerDefault
	| block |
	block := [ :stream | stream close ] compiledBlock.
	self assert: FLSerializer new streamFinalizer compiledBlock equals: block.
	self assert: FLMaterializer new streamFinalizer compiledBlock equals: block