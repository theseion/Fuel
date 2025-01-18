asserting
assertCleanBlockOuterContextBasedOnCompilationOption: aClosure

	Smalltalk compiler compilationContext optionCleanBlockClosure
		ifTrue: [ self assert: aClosure outerContext isNil ]
		ifFalse: [ self assert: aClosure outerContext isNotNil ]