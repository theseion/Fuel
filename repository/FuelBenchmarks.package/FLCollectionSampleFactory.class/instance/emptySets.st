samples
emptySets
	
	^ (self emptyCollectionsOfAll: self fewCollectionClasses) collect: [:each | each asSet ]