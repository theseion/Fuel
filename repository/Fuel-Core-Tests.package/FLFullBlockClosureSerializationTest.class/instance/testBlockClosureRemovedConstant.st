tests
testBlockClosureRemovedConstant
	"Raise an error when materializing a closure whose method was removed."

	| aClass aClosure |
	aClass := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'methodWithClosure  ^ [ 42 ]'
		in: aClass.
	aClosure := aClass new perform: #methodWithClosure.
	self assert: aClosure isClean.
	self assertConstantBlockOuterContextBasedOnCompilationOption: aClosure.
	Smalltalk compiler compilationContext optionConstantBlockClosure ifTrue: [ 
		self assert: aClosure class equals: (Smalltalk at: #ConstantBlockClosure) ].
	
	self serializer fullySerializeMethod: aClosure compiledBlock method.
	self serialize: aClosure.
	aClass removeSelectorSilently: #methodWithClosure.
	self should: [ self materialized ] raise: FLMethodChanged.
	
	self materializer disableMethodChangedWarning.
	self materialized