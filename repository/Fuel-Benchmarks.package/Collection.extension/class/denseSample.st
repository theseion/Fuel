*Fuel-Benchmarks
denseSample
	
	| desiredSize |
	desiredSize := (self new capacity * 0.85) floor.
	^ self new 
		addAll: (1 to: desiredSize); 
		yourself