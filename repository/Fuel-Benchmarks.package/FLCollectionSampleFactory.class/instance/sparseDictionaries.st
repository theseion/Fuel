samples
sparseDictionaries

	^ (self sparseCollectionsOfAll: self fewCollectionClasses) select: [:each | each isDictionary ]