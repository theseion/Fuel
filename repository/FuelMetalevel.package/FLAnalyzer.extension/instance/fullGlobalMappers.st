*FuelMetalevel
fullGlobalMappers

	^ Array with: (
		FLFullGlobalMapper 
			newWithInternalBehaviors: internalClasses 
			internalMethods: internalMethods 
			globalSymbols: globalSymbols
			globalEnvironment: globalEnvironment).
	