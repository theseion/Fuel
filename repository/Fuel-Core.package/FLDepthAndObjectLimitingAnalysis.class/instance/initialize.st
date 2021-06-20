initialization
initialize
	super initialize.
	
	objectCounter := 0.
	objectLimit := self configuration objectLimit.
	previousStackSize := 0.
	depth := 0.
	depthLimit := self configuration depthLimit