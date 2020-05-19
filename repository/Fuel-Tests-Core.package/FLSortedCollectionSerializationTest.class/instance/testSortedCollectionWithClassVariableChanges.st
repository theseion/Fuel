tests
testSortedCollectionWithClassVariableChanges
	"Tests serialization of a SortedCollection whose sortBlock has a reference to a class variable and its value is changed. See also FLBlockClosureSerializationTest >> testBlockClosureWithClassVariableChanges  and FLCompiledMethodSerializationTest >> testMethodChangingClassVariable"

	| aSortedCollection materialized mmethod index sortBlock classVariableInMethod |
	ClassVariableForTesting := false.
	
	aSortedCollection := self class sortedCollectionForTestingWithClassVariable.
	materialized := self resultOfSerializeAndMaterialize: aSortedCollection.
	"the class variable ClassVariableForTesting should be false"
	
	sortBlock := materialized sortBlock.
	
	classVariableInMethod := sortBlock isFullBlock 
		ifTrue: [ 
			index := sortBlock method literals indexOf: (self class bindingOf: #ClassVariableForTesting).
			sortBlock method literalAt: index	] 
		ifFalse: [ 
			mmethod := materialized sortBlock outerContext method.
			index := mmethod literals indexOf: (self class bindingOf: #ClassVariableForTesting).
			mmethod literalAt: index].
	
	self deny: classVariableInMethod value.
	ClassVariableForTesting := true.
	"the class variable ClassVariableForTesting should be true"
	self assert: classVariableInMethod value.
	
