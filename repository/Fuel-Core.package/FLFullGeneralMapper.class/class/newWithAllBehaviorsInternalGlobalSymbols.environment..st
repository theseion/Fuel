instance creation
newWithAllBehaviorsInternalGlobalSymbols: globalSymbols environment: anEnvironment
	^ self basicNew
		initializeWithAllBehaviorsIntrnalGlobalSymbols: globalSymbols
			environment: anEnvironment;
		yourself 
		