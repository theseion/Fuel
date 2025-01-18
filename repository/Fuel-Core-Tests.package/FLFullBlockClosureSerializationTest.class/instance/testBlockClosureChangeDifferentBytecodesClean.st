tests
testBlockClosureChangeDifferentBytecodesClean
	"Raise an error when materializing a non-clean closure whose method has changed bytecodes."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ :x | x ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assertCleanBlockOuterContextBasedOnCompilationOption: aClosure.
	
	self serializer fullySerializeMethod: aClosure compiledBlock method.
	self serialize: aClosure.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ 43'
		in: aClass.
	self should: [ self materialized ] raise: FLMethodChanged.
	
	self materializer disableMethodChangedWarning.
	self materialized