running
setUp
	super setUp.
	self setUpClassFactory.
	self setUpSerializer.
	self setUpMaterializer.
	"You have several stream strategies available on 'stream-strategies' category."
	self useFileReferenceStream.

	"When rerunning tests from the test runner #initialize
	will not be sent to the instance but the previous run will
	have torn down the variable"
	testingEnvironment ifNil: [ 
		testingEnvironment := Smalltalk globals ]