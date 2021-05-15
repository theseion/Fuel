tests
testSortedCollectionWithClassVariableChanges
	"Tests serialization of a SortedCollection whose sortBlock has a reference to a class variable and its value is changed. See also FLBlockClosureSerializationTest >> testBlockClosureWithClassVariableChanges  and FLCompiledMethodSerializationTest >> testMethodChangingClassVariable"

	| aSortedCollection materialized compiledBlock index |
	ClassVariableForTesting := false.
	
	aSortedCollection := self class sortedCollectionForTestingWithClassVariable.
	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	"the class variable ClassVariableForTesting should be false"
	
	compiledBlock := materialized sortBlock compiledBlock.
	
	index := compiledBlock literals indexOf: (self class bindingOf: #ClassVariableForTesting).
	
	self deny: (compiledBlock literalAt: index) value.
	ClassVariableForTesting := true.
	"the class variable ClassVariableForTesting should be true"
	self assert: (compiledBlock literalAt: index) value
	
