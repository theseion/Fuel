tests
testSortedCollectionWithClassVariableChanges
	"Tests serialization of a SortedCollection whose sortBlock has a reference to a class variable and its value is changed. See also FLBlockClosureSerializationTest >> testBlockClosureWithClassVariableChanges  and FLCompiledMethodSerializationTest >> testMethodChangingClassVariable"

	| aSortedCollection materialized compiledBlock index literalHolder |
	CompilationContext optionCleanBlockClosure ifTrue: [ ^ self skip ].

	ClassVariableForTesting := false.
	
	aSortedCollection := self class sortedCollectionForTestingWithClassVariable.
	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	"the class variable ClassVariableForTesting should be false"
	
	compiledBlock := materialized sortBlock.
	
	literalHolder := compiledBlock isFullBlock 
		ifTrue: [ compiledBlock method ] 
		ifFalse: [ materialized sortBlock outerContext method ].
	index := literalHolder literals indexOf: (self class bindingOf: #ClassVariableForTesting).
	
	self deny: (literalHolder literalAt: index) value.
	ClassVariableForTesting := true.
	"the class variable ClassVariableForTesting should be true"
	self assert: (literalHolder literalAt: index) value