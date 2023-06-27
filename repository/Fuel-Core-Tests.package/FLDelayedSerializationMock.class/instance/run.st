running
run
	self configuration
		at: #delayedMockUsed
		put: true.
		
	super run