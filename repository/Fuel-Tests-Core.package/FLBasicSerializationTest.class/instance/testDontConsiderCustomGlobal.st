tests-globals
testDontConsiderCustomGlobal
	"A custom global variable is not treated as global by Fuel, unless we explicitly specify this."

	| aPerson globalName |
	aPerson := FLPerson new.
	globalName := #FLGlobalVariableForTesting.

	[ testingEnvironment at: globalName put: aPerson.
	self deny: (self resultOfSerializeAndMaterialize: aPerson) identicalTo: aPerson ]
		ensure: [ testingEnvironment removeKey: globalName ]