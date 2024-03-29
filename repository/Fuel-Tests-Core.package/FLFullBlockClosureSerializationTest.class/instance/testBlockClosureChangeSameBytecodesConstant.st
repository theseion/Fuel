tests
testBlockClosureChangeSameBytecodesConstant
	"Raise an error when materializing a constant closure whose method has changed bytecodes.
	In constant closure, the closure is replaced by the literal, so when
	the literal changes (bytecodes would still be identical) users should be warned."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 42 ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assert: aClosure outerContext isNil.
	self assert: aClosure class equals: (Smalltalk at: #ConstantBlockClosure).
	
	self serializer fullySerializeMethod: aClosure compiledBlock method.
	self serialize: aClosure.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ 43'
		in: aClass.
	self should: [ self materialized ] raise: FLMethodChanged.
	
	self materializer disableMethodChangedWarning.
	self materialized