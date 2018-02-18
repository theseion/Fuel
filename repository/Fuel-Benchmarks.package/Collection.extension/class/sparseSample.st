*Fuel-Benchmarks
sparseSample
	
	| desiredSize |
	desiredSize := (self new capacity * 0.25) floor.
	^ self new 
		addAll: (1 to: desiredSize); 
		yourself