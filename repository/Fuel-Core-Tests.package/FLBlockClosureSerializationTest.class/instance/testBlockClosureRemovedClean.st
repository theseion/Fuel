tests-change
testBlockClosureRemovedClean
	"Raise an error when materializing a clean closure whose method was removed.
	Send #yourself to prevent ConstantBlockClosure optmization."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 42 yourself ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assertCleanBlockOuterContextBasedOnCompilationOption: aClosure.
	
	self serialize: aClosure.
	aClass removeSelectorSilently: #methodWithClosure.
	self should: [ self materialized ] raise: FLMethodNotFound