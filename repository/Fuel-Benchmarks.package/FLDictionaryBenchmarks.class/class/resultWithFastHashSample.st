instance creation
resultWithFastHashSample
	
	|benchs|
	benchs := (self newWith: Dictionary).
	^benchs runWith: benchs smallintegersAndStringsSampleDictionary. 