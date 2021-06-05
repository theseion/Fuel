accessing
useLightMappers

	globalMappersFactory := [ self lightGlobalMappers ].
	generalMapperFactory := [ { 
		FLFullGeneralMapper new.
		FLLightGeneralMapper new } ]