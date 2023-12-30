tests-manual
testClassRename

	| pointClass aPoint resultPoint pointClassName |
	pointClass := self classFactory make: [ :aBuilder | aBuilder slots: #(x y) ].
	pointClassName := pointClass name.
	aPoint := pointClass new.
	aPoint instVarNamed: 'x' put: 7.
	aPoint instVarNamed: 'y' put: 11.

	self serialize: aPoint.
	self classFactory silentlyRename: pointClass to: pointClassName , 'Renamed'.

	self materializer migrateClassNamed: pointClassName toClass: pointClass.

	resultPoint := self materialized.

	self assert: (resultPoint instVarNamed: 'x') equals: 7.
	self assert: (resultPoint instVarNamed: 'y') equals: 11