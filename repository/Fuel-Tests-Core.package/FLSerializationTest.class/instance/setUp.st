running
setUp
	super setUp.
	
	self
		setUpEnvironment;
		setUpClassFactory;
		setUpSerializer;
		setUpMaterializer;
		"You have several stream strategies available on 'stream-strategies' category."
		useFileReferenceStream