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

	self materializer
		migrateClassNamed: pointClassName
		toClass: pointClass
		variables: (Dictionary new
			at: 'x' put: 'posX';
			at: 'y' put: 'posY';
			yourself).

	resultPoint := self materialized.

	self assert: (resultPoint instVarNamed: 'posX') equals: 7.
	self assert: (resultPoint instVarNamed: 'posY') equals: 11