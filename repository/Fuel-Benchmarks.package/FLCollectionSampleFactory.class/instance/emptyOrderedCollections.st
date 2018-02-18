samples
emptyOrderedCollections
	
	^ (self emptyCollectionsOfAll: self fewCollectionClasses) collect: [:each | each asOrderedCollection ]