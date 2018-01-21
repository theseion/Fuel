samples
denseOrderedCollections
	
	^ (self denseCollectionsOfAll: self fewCollectionClasses) collect: [:each | each asOrderedCollection ]