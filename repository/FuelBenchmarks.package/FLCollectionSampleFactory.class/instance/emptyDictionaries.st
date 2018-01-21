samples
emptyDictionaries
	
	^ (self emptyCollectionsOfAll: self fewCollectionClasses) select: [:each | each isDictionary ]