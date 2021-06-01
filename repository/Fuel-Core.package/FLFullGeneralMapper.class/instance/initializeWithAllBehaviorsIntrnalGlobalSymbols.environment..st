initialization
initializeWithAllBehaviorsIntrnalGlobalSymbols: explicitExternals environment: anEnvironment
	self initialize.
	
	shouldConsiderAllBehaviorsInternal := true.
	globalSymbols := explicitExternals.
	environment := anEnvironment