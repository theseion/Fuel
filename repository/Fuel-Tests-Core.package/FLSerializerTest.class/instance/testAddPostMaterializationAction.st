tests-configuring-materialization
testAddPostMaterializationAction
	| block |
	block := [ :x | 1 + 2 ].
	self serializer addPostMaterializationAction: block.
	
	self assert: self serializer postMaterializationActions size equals: 1.
	self assert: self serializer postMaterializationActions anyOne compiledBlock equals: block compiledBlock