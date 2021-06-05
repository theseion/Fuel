initialization
initialize
	super initialize.
	
	header := FLHeader new
		additionalObjects: self configuration additionalObjects;
		preMaterializationActions: self configuration preMaterializationActions;
		postMaterializationActions: self configuration postMaterializationActions;
		yourself