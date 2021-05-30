initialization
initializeWithInternalBehaviors: explicitInternals internalMethods: methods globalSymbols: explicitExternals
	self initialize.
	
	internalBehaviors := explicitInternals.
	internalMethods := methods.
	globalSymbols := explicitExternals