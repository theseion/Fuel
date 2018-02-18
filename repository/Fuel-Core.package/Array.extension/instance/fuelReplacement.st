*Fuel-Core
fuelReplacement
	^ self == Smalltalk specialObjectsArray
		ifTrue: [ nil ]
		ifFalse: [ self ]