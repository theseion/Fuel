asserting
assertConstantBlockOuterContextBasedOnCompilationOption: aClosure

	Smalltalk compiler compilationContext optionConstantBlockClosure
		ifTrue: [ self assert: aClosure outerContext isNil ]
		ifFalse: [ self assert: aClosure outerContext isNotNil ]