tests-change
testCleanBlockClosureChangeDifferentBytecodes
	"Don't raise an error when materializing a clean closure whose (irrelevant) method has changed bytecodes."

	| aClass aClosure |
	aClass := self newClass
		duringTestCompileSilently: 'methodWithClosure  ^ [ 42 ]';
		yourself.
	aClosure := aClass new perform: #methodWithClosure.
	self serialize: aClosure.
	aClass duringTestCompileSilently: 'methodWithClosure  ^ 42'.
	self shouldnt: [ self materialized ] raise: FLMethodChanged