tests
testCompiledMethodChangedConstant
	"A compiled methods should be serialized as global by default.
	On materialization, it must be found in the global environment, and the bytecodes hash must be the same.
	Changes to closures are not relevant."
	
	| classA classB |
	classA := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile:  'm  ^ [ 41 ]'
		in: classA.
	classB := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm  ^ [ 42 ]'
		in: classB.

	self materializer environment: (Dictionary new
		at: classA name put: classB;
		yourself).

	self serialize: classA >> #m.

	self
		shouldnt: [ self materialized ]
		raise: FLMethodChanged