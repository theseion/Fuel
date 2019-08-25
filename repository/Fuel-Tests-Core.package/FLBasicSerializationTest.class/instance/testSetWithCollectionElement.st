tests-collections-Pharo1.3
testSetWithCollectionElement
	(Smalltalk classNamed: #CollectionElement) ifNil: [ self skip ].
	
	self assertSerializationEqualityOf: (Set with: ((Smalltalk classNamed: #CollectionElement) with: 3))