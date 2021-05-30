accessing
useLightMappers

	globalMappersFactory := [ self lightGlobalMappers ].
	generalMapperFactory := [
		{
			shouldConsiderAllBehaviorsInternal
				ifFalse: [
					FLFullGeneralMapper 
						newWithInternalBehaviors: internalClasses 
						internalMethods: internalMethods 
						globalSymbols: globalSymbols ]
				ifTrue: [ FLFullGeneralMapper newWithAllBehaviorsInternalGlobalSymbols: globalSymbols ].
			 FLLightGeneralMapper new
		} ]