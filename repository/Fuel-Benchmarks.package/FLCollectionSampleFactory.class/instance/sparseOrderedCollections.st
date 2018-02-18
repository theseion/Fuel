samples
sparseOrderedCollections

	^ (self sparseCollectionsOfAll: self fewCollectionClasses) collect: [:each | each asOrderedCollection ]