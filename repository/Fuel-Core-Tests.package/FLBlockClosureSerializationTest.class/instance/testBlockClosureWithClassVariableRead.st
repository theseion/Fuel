tests-clean
testBlockClosureWithClassVariableRead
	| closure materializedClosure |
	Smalltalk compiler compilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	ClassVariableForTesting := nil.
	closure := [ ClassVariableForTesting ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.

	ClassVariableForTesting := true.
	self assert: materializedClosure value.
	ClassVariableForTesting := false.
	self deny: materializedClosure value