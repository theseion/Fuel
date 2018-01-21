samples
points

	^ (1 to: self problemSize) 
		collect: [ :i | i @ (i+1) ]