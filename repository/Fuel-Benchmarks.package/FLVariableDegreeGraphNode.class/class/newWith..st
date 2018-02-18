instance creation
newWith: aCollectionOfNodes

	^self basicNew
		initialize;
		children: aCollectionOfNodes;
		yourself.