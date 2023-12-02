*Fuel-Core
fuelAccept: aGeneralMapper forInstance: anObject
	anObject fuelCheckEphemeronSupport.
	
	aGeneralMapper visitEphemeron: anObject