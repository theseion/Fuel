initialization
initializeWithInternalBehaviors: explicitInternals internalMethods: methods globalSymbols: explicitExternals environment: anEnvironment
	self initialize.
	
	internalBehaviors := explicitInternals.
	internalMethods := methods.
	globalSymbols := explicitExternals.
	environment := anEnvironment