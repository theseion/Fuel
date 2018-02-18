samples
denseDictionaries
	
	^ (self denseCollectionsOfAll: self fewCollectionClasses) select: [:each | each isDictionary ]