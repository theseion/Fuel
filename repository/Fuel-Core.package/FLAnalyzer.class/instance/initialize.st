initialization
initialize

	super initialize.
	self setDefaultAnalysis.
	self useLightMappers.
	pluggableSubstitutions := OrderedCollection new.
	internalClasses := IdentitySet new.
	internalMethods := IdentitySet new.
	shouldConsiderAllBehaviorsInternal := false.
	globalEnvironment := self class environment.
	globalSymbols := self class defaultGlobalSymbols asIdentitySet.
