samples
sparseSets

	^ (self sparseCollectionsOfAll: self fewCollectionClasses) collect: [:each | each asSet ]