finalization
finalizeStream
	self configuration shouldFinalizeStream ifFalse: [ ^ self ].
	
	self configuration streamFinalizer value: self stream