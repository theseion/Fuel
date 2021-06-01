accessing
useLightMappers

	globalMappersFactory := [ self lightGlobalMappers ].
	generalMapperFactory := [ 
	                        { 
		                        (shouldConsiderAllBehaviorsInternal
			                         ifFalse: [ 
				                         FLFullGeneralMapper
					                         newWithInternalBehaviors:
					                         internalClasses
					                         internalMethods: internalMethods
					                         globalSymbols: globalSymbols
					                         environment: globalEnvironment ]
			                         ifTrue: [ 
				                         FLFullGeneralMapper
					                         newWithAllBehaviorsInternalGlobalSymbols:
					                         globalSymbols
					                         environment: globalEnvironment ]).
		                        FLLightGeneralMapper new } ]