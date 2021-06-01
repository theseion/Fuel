tests
testProxyByTarget
	| aProxyClass result original |
	aProxyClass := self classFactory silentlyNewClassWithClassVariableNames: 'target'.
	self classFactory
		silentlyCompile: 'target: x  target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: target' in: aProxyClass.

	original := aProxyClass new
		target: 5;
		yourself.

	result := self resultOfSerializeAndMaterialize: original.

	self assert: 5 equals: result