materializing
runHeaderSteps
	self
		fileHeaderStep;
		decoderHeaderStep;
		headerStep.
		
	self configuration shouldMaterializeHeaderOnly ifFalse: [ ^ self ].
	
	root := header.
	self stop