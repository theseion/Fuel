tests
testSupportForFinalizationRegistryEntry
	| ephemeron |
	ephemeron := FinalizationRegistryEntry new.
	self
		should: [ ephemeron fuelCheckEphemeronSupport ]
		raise: FLNotSerializable
		whoseDescriptionIncludes: 'Unsupported ephemeron implementation'
		description: 'FinalizationRegistryEntry serialization is not supported'