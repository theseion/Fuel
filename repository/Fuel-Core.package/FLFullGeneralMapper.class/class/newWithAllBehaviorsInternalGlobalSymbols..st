instance creation
newWithAllBehaviorsInternalGlobalSymbols: globalSymbols
	^ self basicNew
		initializeWithAllBehaviorsIntrnalGlobalSymbols:  globalSymbols;
		yourself 
		