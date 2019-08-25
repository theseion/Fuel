tests-collections-Pharo1.3
testCollectionElement
	(Smalltalk classNamed: #CollectionElement) ifNil: [ self skip ].
	
	self assertSerializationEqualityOf: ((Smalltalk classNamed: #CollectionElement) with: 3)