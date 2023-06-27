tests-change
testBlockClosureChangeDifferentBytecodes
	"Raise an error when materializing a clean closure whose method has changed bytecodes.
	Send #yourself to prevent ConstantBlockClosure optmization."

	| aClass aClosure |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 42 yourself ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assert: aClosure notNil.
	
	self serialize: aClosure.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ 42'
		in: aClass.
	self should: [ self materialized ] raise: FLMethodChanged.
	
	self materializer disableMethodChangedWarning.
	self materialized