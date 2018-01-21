instance creation
resultWithSlowHashSample
	
	|benchs|
	benchs := (self newWith: Dictionary).
	^benchs runWith: benchs stringsAndSmallintegersSampleDictionary. 