initialization
initialize

	super initialize.
	self setDefaultAnalysis.
	self useLightMappers.
	pluggableSubstitutions := OrderedCollection new.
	internalBehaviors := IdentitySet new.
	internalMethods := IdentitySet new.
	globalEnvironment := self class environment.
	globalSymbols := self class defaultGlobalSymbols asIdentitySet