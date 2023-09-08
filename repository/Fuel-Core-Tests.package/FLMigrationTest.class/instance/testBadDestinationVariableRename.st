tests-manual
testBadDestinationVariableRename

	| pointClass aPoint pointClassName |
	pointClass := self classFactory make: [ :aBuilder | aBuilder slotsFromString: 'x y' ].
	pointClassName := pointClass name.
	aPoint := pointClass new.

	self materializer migrateClassNamed: pointClassName variables: (Dictionary new
			 at: 'x' put: 'posX';
			 yourself).

	self serialize: aPoint.
	self should: [ self materialized ] raise: Error.

	self flag: #pharoTodo "Assert an specific materialization error"