execution
execute 

	self prepareImageAndExit.
	
	self validateParameters.
	self processFiles.
	
	self saveSessionIfAsked
