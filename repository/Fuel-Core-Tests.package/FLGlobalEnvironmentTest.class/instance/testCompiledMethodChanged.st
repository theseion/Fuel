tests
testCompiledMethodChanged
	"A compiled methods should be serialized as global by default.
	On materialization, it must be found in the global environment, and the bytecodes hash must be the same.
	Else, raise a proper error."
	
	| classA classB |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	classA := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile:  'm  ^ 42'
		in: classA.
	classB := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm  ^ [ 42 yourself ]'
		in: classB.

	self materializer environment: (Dictionary new
		at: classA name put: classB;
		yourself).

	self serialize: classA >> #m.

	self
		should: [ self materialized ]
		raise: FLMethodChanged 
		description: 'Serialized and materialized methods should have the same bytecodes.'