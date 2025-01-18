tests-change
testBlockClosureChangeSameBytecodesFull
	"Tolerate materializing a clean closure whose method has changed but not the bytecodes.
	Send #yourself to prevent ConstantBlockClosure optmization."

	| aClass aClosure materializedClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ self yourself ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self deny: aClosure isClean.
	self assert: aClosure outerContext isNotNil.
	
	self serialize: aClosure.
	self classFactory
		silentlyCompile:  'methodWithClosure  ^ [ self yourself]'
		in: aClass.
	self deny: aClosure method isInstalled.
	materializedClosure := self materialized.
	self assert: materializedClosure value class equals: aClass