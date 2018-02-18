samples
rectangles

	| step |
	step := 4.
	^ (1 to: self problemSize by: step) 
		collect: [ :i | i@(i+1) corner: (i+2)@(i+3) ]
