samples
denseSets
	
	^ (self denseCollectionsOfAll: self fewCollectionClasses) collect: [:each | each asSet ]