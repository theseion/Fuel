initialization
initialize
	super initialize.
	
	depthLimit := self configuration depthLimit.
	previousStackSize := 0.
	depth := 0