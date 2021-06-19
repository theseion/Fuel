initialization
initialize
	super initialize.
	
	objectStack := FLSimpleStack new.
	privateObjectStack := FLSimpleStack new.
	clusterization := FLClusterization new.
	
	self context analysis: self.

	self initializeMapperChains