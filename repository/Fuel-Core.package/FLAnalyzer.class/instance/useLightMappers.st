accessing
useLightMappers

	globalMappersFactory := [ self lightGlobalMappers ].
	generalMapperFactory := [ { 
		FLFullGeneralMapper
			newWithInternalBehaviors: internalBehaviors
			internalMethods: internalMethods
			globalSymbols: globalSymbols
			environment: globalEnvironment.
		FLLightGeneralMapper new } ]