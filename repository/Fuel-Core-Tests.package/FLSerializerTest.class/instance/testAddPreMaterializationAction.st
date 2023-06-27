tests-configuring-materialization
testAddPreMaterializationAction
	| block |
	block := [ :x | 1 + 2 ].
	self serializer addPreMaterializationAction: block.
	
	self assert: self serializer preMaterializationActions size equals: 1.
	self assert: self serializer preMaterializationActions anyOne compiledBlock equals: block compiledBlock