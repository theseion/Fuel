tests
testGetOneFileToProcessWheOneFuelFileGivenInArguments

	| command |
	context := FLFuelCliCommand commandSpecification activationWith: #( 'fuel' 'foo.fuel' ).
	command := context command.

	self
		assertCollection: command allFuelFiles 
		hasSameElements: #( 'foo.fuel' )