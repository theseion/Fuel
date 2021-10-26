tests
testProxyByTargetInsideObjectAndAnalisysIsPropagated
	| aProxyClass result original pair pairRoot |
	aProxyClass := self classFactory silentlyNewClassWithClassVariableNames: 'Target'.
	self classFactory
		silentlyCompile:  'target: x  target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: target' in: aProxyClass.

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