tests
testCompiledMethod
	"Any compiled method should be serialized as global by default. On materialization, it should be found in the global environment, and the bytecodes hash must be the same."

	| classA classB |
	classA := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm ^ 42'
		in: classA.
	classB := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm    ^   42  '
		in: classB.
	self assert: (classA >> #m) bytecodesHash equals: (classB >> #m) bytecodesHash.
	self deny: classA >> #m identicalTo: classB >> #m.

	self materializerConfig environment: (Dictionary new
		at: classA name put: classB;
		yourself).

	self assert: (self resultOfSerializeAndMaterialize: classA >> #m) identicalTo: classB >> #m