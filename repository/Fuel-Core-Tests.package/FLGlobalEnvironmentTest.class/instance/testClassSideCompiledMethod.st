tests
testClassSideCompiledMethod
	"Any class-side compiled method should be serialized as global by default. On materialization, it should be found in the global environment, and the bytecodes hash must be the same."

	| classA classB |
	classA := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm  ^ 42'
		in: classA class.
	classB := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'm   ^   42  '
		in: classB class.
	self assert: (classA class >> #m) bytecodesHash equals: (classB class >> #m) bytecodesHash.
	self deny: classA class >> #m identicalTo: classB class >> #m.

	self materializer environment: (Dictionary new
		at: classA name put: classB;
		yourself).

	self assert: (self resultOfSerializeAndMaterialize: classA class >> #m) identicalTo: classB class >> #m