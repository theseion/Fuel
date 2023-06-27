tests-clean
testBlockClosureWithGlobalVariable
	| closure materializedClosure |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	closure := [ Smalltalk ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: materializedClosure value equals: Smalltalk