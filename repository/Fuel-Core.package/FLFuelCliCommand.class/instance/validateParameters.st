validating
validateParameters

	self allFuelFiles ifEmpty: [ ^ self context exitFailure: 'Missing Fuel file as argument' ]