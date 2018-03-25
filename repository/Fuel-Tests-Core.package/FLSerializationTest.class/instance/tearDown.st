running
tearDown
	self
		tearDownClassFactory;
		tearDownGlobalVariables.
	self streamFactory tearDown.
	self tearDownInstanceVariables.
	
	super tearDown