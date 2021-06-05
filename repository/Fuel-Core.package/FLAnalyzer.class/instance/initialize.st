initialization
initialize
	super initialize.
	
	self useLightMappers.
	pluggableSubstitutions := self configuration whenBlocks.
	globalEnvironment := self configuration environment