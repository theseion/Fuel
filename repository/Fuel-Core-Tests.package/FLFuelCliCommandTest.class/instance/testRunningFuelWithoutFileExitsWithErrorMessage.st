tests
testRunningFuelWithoutFileExitsWithErrorMessage
	context := FLFuelCliCommand commandSpecification activateWith: #('fuel').
	
	self assertFailure.
	self
		assert: context exitException messageText
		equals: 'Missing Fuel file as argument'