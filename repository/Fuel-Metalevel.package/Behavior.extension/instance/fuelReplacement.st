*Fuel-Metalevel
fuelReplacement
	^ self isAnonymous
		ifFalse: [ self ]
		ifTrue: [ nil ]