tests
testMethodAccessingAClassVariable
	| aClassWithVariable aMethod materializedMethod |
	aClassWithVariable := self
		newSubclassOf: Object 
		instanceVariableNames: '' 
		classVariableNames: 'A'.

	aClassWithVariable compileSilently: 'm1 A:= 3'.
	aMethod := aClassWithVariable >> #m1.
	aClassWithVariable classVarNamed: #A put: 7. 
	
	materializedMethod := self resultOfSerializeAndMaterialize: aMethod.
	
	self assertCollection: materializedMethod literals hasSameElements: aMethod literals.
	self assert: (materializedMethod literalAt: 2) identicalTo: (aMethod literalAt: 2).