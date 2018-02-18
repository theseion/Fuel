instance-creation
newWithInternalBehaviors: internals internalMethods: methods globalSymbols: globalSymbols globalEnvironment: globalEnvironment

	^self basicNew
		initializeWithInternalBehaviors: internals
		internalMethods: methods 
		globalSymbols: globalSymbols
		globalEnvironment: globalEnvironment;
		yourself 
		