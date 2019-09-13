running
setUp
	super setUp.
	self setUpClassFactory.
	self setUpSerializer.
	self setUpMaterializer.
	self setUpEnvironment.
	"You have several stream strategies available on 'stream-strategies' category."
	self useFileReferenceStream
