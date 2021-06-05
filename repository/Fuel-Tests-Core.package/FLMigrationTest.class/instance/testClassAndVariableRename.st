tests-manual
testClassAndVariableRename
	| pointClass aPoint resultPoint pointClassName |
	pointClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'x y'.
	pointClassName := pointClass name.
	aPoint := pointClass new.
	aPoint instVarNamed: 'x' put: 7.
	aPoint instVarNamed: 'y' put: 11.

	self serialize: aPoint.
	self classFactory
		silentlyRename: pointClass
		to: (pointClassName , 'Renamed') asSymbol.
	pointClass := self redefined: pointClass with: 'posY posX'.

	self materializerConfig
		migrateClassNamed: pointClassName
		toClass: pointClass
		variables: {('x' -> 'posX') . ('y' -> 'posY')}.

	resultPoint := self materialized.

	self assert: (resultPoint instVarNamed: 'posX') equals: 7.
	self assert: (resultPoint instVarNamed: 'posY') equals: 11