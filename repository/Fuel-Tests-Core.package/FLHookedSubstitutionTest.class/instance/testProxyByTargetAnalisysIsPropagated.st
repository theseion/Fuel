tests
testProxyByTargetAnalisysIsPropagated
	| aProxyClass result pair original |
	aProxyClass := (self newSubclassOf: Object instanceVariableNames: 'target' classVariableNames: '')
		duringTestCompileSilently: 'target: x  target := x';
		duringTestCompileSilently: 'fuelAccept: aVisitor  ^aVisitor visitSubstitution: self by: target';
		yourself.

	pair := FLPair new
		left: 6;
		right: 'foo';
		yourself.

	original := aProxyClass new
		target: pair;
		yourself.

	result := self resultOfSerializeAndMaterialize: original.

	self assert: result left equals: 6.
	self assert: result right equals: 'foo'