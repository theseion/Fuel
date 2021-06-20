materializing
runHeaderSteps
	self
		fileHeaderStep;
		decoderHeaderStep;
		headerStep.
		
	self configuration shouldMaterializeHeaderOnly ifFalse: [ ^ self ].
	
	self stop