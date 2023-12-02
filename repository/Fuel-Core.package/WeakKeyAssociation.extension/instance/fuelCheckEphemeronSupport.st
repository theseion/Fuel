*Fuel-Core
fuelCheckEphemeronSupport
	container isDictionary ifFalse: [
		FLNotSerializable signal: 'Unsupported use of ephemeron' ]