tests-change
testBlockClosureChangeSameBytecodesConstant
	"Tolerate materializing a clean closure whose method has changed but not the bytecodes.
	In constant closure, the closure is replaced by the literal, so when
	the literal changes (bytecodes would still be identical) users should be warned."

	| aClass aClosure materializedClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 41 ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assert: aClosure outerContext isNil.
	self assert: aClosure class equals: (Smalltalk at: #ConstantBlockClosure).
	
	self serialize: aClosure.
	self classFactory
		silentlyCompile:  'methodWithClosure  ^ 42'
		in: aClass.
	self deny: aClosure method isInstalled.
	materializedClosure := self materialized.
	self assert: materializedClosure value equals: 41