tests-change
testBlockClosureChangeSameBytecodesClean
	"Tolerate materializing a clean closure whose method has changed but not the bytecodes.
	Send #yourself to prevent ConstantBlockClosure optmization."

	| aClass aClosure materializedClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 41 yourself ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assertCleanBlockOuterContextBasedOnCompilationOption: aClosure.
	
	self serialize: aClosure.
	self classFactory
		silentlyCompile:  'methodWithClosure  ^ [ 42 yourself]'
		in: aClass.
	self deny: aClosure method isInstalled.
	materializedClosure := self materialized.
	self assert: materializedClosure value equals: 42