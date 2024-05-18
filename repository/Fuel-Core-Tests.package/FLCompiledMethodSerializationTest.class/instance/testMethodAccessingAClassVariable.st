tests
testMethodAccessingAClassVariable

	| aClassWithVariable aMethod materializedMethod |
	aClassWithVariable := self classFactory silentlyMake: [ :aBuilder | aBuilder sharedVariables: #(A) ].

	self classFactory silentlyCompile: 'm1 A:= 3' in: aClassWithVariable.
	aMethod := aClassWithVariable >> #m1.
	aClassWithVariable writeClassVariableNamed: #A value: 7.

	materializedMethod := self resultOfSerializeAndMaterialize: aMethod.

	self assertCollection: materializedMethod literals hasSameElements: aMethod literals.
	self assert: (materializedMethod literalAt: 2) identicalTo: (aMethod literalAt: 2)