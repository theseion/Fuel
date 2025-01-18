tests-clean
testNestedBlockClosure
	| closure materializedClosure |
	Smalltalk compiler compilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	closure := [ [ 42 ] ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: materializedClosure value value equals: 42