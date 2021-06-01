instance creation
newWithInternalBehaviors: internals internalMethods: methods globalSymbols: globalSymbols environment: anEnvironment
	^ self basicNew
		initializeWithInternalBehaviors: internals
			internalMethods: methods 
			globalSymbols: globalSymbols
			environment: anEnvironment;
		yourself 
		