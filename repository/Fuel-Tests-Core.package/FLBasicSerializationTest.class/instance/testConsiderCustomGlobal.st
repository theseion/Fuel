tests-globals
testConsiderCustomGlobal
	"A custom global variable is treated as global by Fuel, when we explicitly specify this."
	
	| aPerson globalKey |	
	globalKey := #FLGlobalVariableForTesting.
	self serializer lookUpInGlobals: globalKey.

	aPerson := FLPerson new.
	self environmentOfTest
		at: globalKey
		put: aPerson.
	self assertSerializationIdentityOf: aPerson
