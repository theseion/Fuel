running
tearDown
	self
		tearDownClassFactory;
		tearDownGlobalVariables.
	self streamFactory tearDown.
	
	super tearDown