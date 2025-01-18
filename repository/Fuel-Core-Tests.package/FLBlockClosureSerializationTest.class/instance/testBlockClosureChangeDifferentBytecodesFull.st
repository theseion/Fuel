tests-change
testBlockClosureChangeDifferentBytecodesFull
	"Raise an error when materializing a clean closure whose method has changed bytecodes.
	Send #yourself to prevent ConstantBlockClosure optmization."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ self yourself ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self deny: aClosure isClean.
	self assert: aClosure outerContext isNotNil.

	self serialize: aClosure.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ self'
		in: aClass.
	self should: [ self materialized ] raise: FLMethodChanged.
	
	self materializer disableMethodChangedWarning.
	self materialized