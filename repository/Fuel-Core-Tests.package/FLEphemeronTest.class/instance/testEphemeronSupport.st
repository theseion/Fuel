tests
testEphemeronSupport
	| unsupported |
	unsupported := { FinalizationRegistryEntry }.
	Object allSubclasses
		select: [ :class |
			class classLayout class == EphemeronLayout and: [
				(unsupported includes: class) not ] ]
		thenDo: [ :class |
			self assert: (class includesSelector: #fuelCheckEphemeronSupport) ]