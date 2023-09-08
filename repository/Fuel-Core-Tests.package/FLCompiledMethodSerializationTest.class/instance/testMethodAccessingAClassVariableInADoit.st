tests
testMethodAccessingAClassVariableInADoit

	| aClassWithVariable aMethod materializedMethod |
	aClassWithVariable := self classFactory silentlyMake: [ :aBuilder | aBuilder sharedVariablesFromString: 'A' ].

	self classFactory silentlyCompile: 'DoIt A:= 3' in: aClassWithVariable.
	aMethod := aClassWithVariable >> #DoIt.
	aClassWithVariable classVarNamed: #A put: 7.

	materializedMethod := self resultOfSerializeAndMaterialize: aMethod.

	self assertCollection: materializedMethod literals hasSameElements: aMethod literals.
	self assert: (materializedMethod literalAt: 2) equals: (aMethod literalAt: 2)