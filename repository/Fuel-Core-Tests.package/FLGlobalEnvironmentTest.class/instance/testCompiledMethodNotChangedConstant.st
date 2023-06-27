tests
testCompiledMethodNotChangedConstant
	"A compiled methods should be serialized as global by default.
	On materialization, it must be found in the global environment, and the bytecodes hash must be the same.
	A method with a constant closure has the same byte codes as a method with just the literal."
	
	| classA classB |
	classA := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile:  'm  ^ [ 41 ]'
		in: classA.
	classB := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm  ^ 41'
		in: classB.

	self materializer environment: (Dictionary new
		at: classA name put: classB;
		yourself).

	self serialize: classA >> #m.

	self
		shouldnt: [ self materialized ]
		raise: FLMethodChanged