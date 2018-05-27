private-extensions-flserializationtest
tearDown
	<flExtensionOf: #FLSerializationTest>
	self
		tearDownClassFactory;
		tearDownGlobalVariables.
	self streamFactory tearDown.
	self tearDownInstanceVariables.
	
	super tearDown