tests-globals
testConsiderCustomGlobal
	"A custom global variable is treated as global by Fuel, when we explicitly specify this."
	
	| aPerson globalKey |
	
	globalKey := #FLGlobalVariableForTesting.
	self analyzer considerGlobal: globalKey.

	aPerson := FLPerson new.
	[ 
		testingEnvironment at: globalKey put: aPerson.
		self assertSerializationIdentityOf: aPerson.
	] ensure: [ testingEnvironment removeKey: globalKey ]