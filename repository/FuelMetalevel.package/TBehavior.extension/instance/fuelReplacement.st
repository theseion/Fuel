*FuelMetalevel
fuelReplacement
	^ self isAnonymous
		ifFalse: [ self ]
		ifTrue: [ nil ]