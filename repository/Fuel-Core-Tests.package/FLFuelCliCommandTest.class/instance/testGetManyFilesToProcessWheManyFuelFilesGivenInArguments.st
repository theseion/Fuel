tests
testGetManyFilesToProcessWheManyFuelFilesGivenInArguments

	| command |
	context := FLFuelCliCommand commandSpecification activationWith: #( 'fuel' 'foo.fuel' 'bar.fuel' 'baz.fuel' 'foo.bar').
	command := context command.

	self
		assertCollection: command allFuelFiles 
		hasSameElements: #( 'foo.fuel' 'bar.fuel' 'baz.fuel' )