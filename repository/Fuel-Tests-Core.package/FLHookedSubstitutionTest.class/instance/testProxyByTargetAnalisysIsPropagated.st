tests
testProxyByTargetAnalisysIsPropagated
	| aProxyClass result pair original |
	aProxyClass := self classFactory silentlyNewClassWithClassVariableNames: 'Target'.
	self classFactory
		silentlyCompile: 'target: x  target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: target' in: aProxyClass.

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