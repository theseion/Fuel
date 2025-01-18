tests
testCleanBlockClosure

	| aClosure meterialized |
	Smalltalk compiler compilationContext optionCleanBlockClosure ifFalse: [ ^ self skip ].

	aClosure := [ :x | x objects detect: [ :y | y isInteger ] ].
	self assert: aClosure isClean.
	self assert: aClosure outerContext isNil.

	self serializer addPostMaterializationAction: aClosure.
	self serialize: 87.

	self materializer disableMethodChangedWarning.
	meterialized := self materialized.

	self assert: meterialized equals: 87