initialization
initialize
	additionalObjects := self configuration additionalObjects.
	preMaterializationActions := self configuration preMaterializationActions.
	postMaterializationActions := self configuration postMaterializationActions