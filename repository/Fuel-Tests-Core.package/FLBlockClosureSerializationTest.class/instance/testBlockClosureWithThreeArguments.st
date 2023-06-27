tests-clean
testBlockClosureWithThreeArguments
	| closure materializedClosure |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	closure := [ :a :b :c | a + b + c ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: (materializedClosure value: 1 value: 2 value: 3) equals: 6