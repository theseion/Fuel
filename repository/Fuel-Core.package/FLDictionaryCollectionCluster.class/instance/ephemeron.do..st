analyzing
ephemeron: anEphemeron do: aBlock
	anEphemeron fuelCheckEphemeronSupport.
	"Add strong reference to key so we know that from
	now on the ephemeron won't be finalized."
	ephemeronKeys add: anEphemeron key.
	"Check that the ephemeron wasn't mourned yet. We might
	have added the strong reference after finalization."
	anEphemeron fuelWasMourned ifFalse: [ aBlock value: anEphemeron ]