tests-clean
testNestedBlockClosure
	| closure materializedClosure |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	closure := [ [ 42 ] ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: materializedClosure value value equals: 42