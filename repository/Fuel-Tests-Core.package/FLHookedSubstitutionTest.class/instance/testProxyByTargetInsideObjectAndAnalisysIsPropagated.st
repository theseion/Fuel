tests
testProxyByTargetInsideObjectAndAnalisysIsPropagated
	| aProxyClass result original pair pairRoot |
	aProxyClass := (self newSubclassOf: Object instanceVariableNames: 'target' classVariableNames: '')
		duringTestCompileSilently: 'target: x  target := x';
		duringTestCompileSilently: 'fuelAccept: aVisitor  ^aVisitor visitSubstitution: self by: target';
		yourself.

	pair := FLPair new
		left: 6;
		right: 'foo'.

	original := aProxyClass new
		target: pair;
		yourself.

	pairRoot := FLPair new
		left: original;
		yourself.

	result := self resultOfSerializeAndMaterialize: pairRoot.

	self assert: result left left equals: 6.
	self assert: result left right equals: 'foo'.
	self assert: result right isNil