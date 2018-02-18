tests
testSharedReferences
	| sharedObject point1 point2 materialized array |
	sharedObject := SmallInteger maxVal + 1.
	point1 := Point x: sharedObject y: SmallInteger maxVal + 2.
	point2 := Point x: SmallInteger maxVal + 2 y: sharedObject.
	array := Array with: point1 with: point2.

	materialized := self resultOfSerializeAndMaterialize: array.
	self assert: array = materialized.
	self 
		assert: materialized first x == materialized second y 
		description: 'An object that is referenced twice by the graph must not be duplicated when materialized'.
	self 
		deny: materialized first y == materialized second x 
		description: 'Two (non-literal) objects must maintain different identity even if they are equal'