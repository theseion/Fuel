running
setUpEnvironment
	"We need the actual globals, otherwise every test will serialize the whole image"
	self testingEnvironment: Smalltalk globals.
	addedGlobals := OrderedCollection new