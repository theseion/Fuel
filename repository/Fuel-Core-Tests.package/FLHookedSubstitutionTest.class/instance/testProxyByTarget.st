tests
testProxyByTarget
	| aProxyClass result original |
	aProxyClass := self classFactory silentlyNewClassWithClassVariableNames: 'Target'.
	self classFactory
		silentlyCompile: 'target: x  Target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: Target' in: aProxyClass.

	original := aProxyClass new
		target: 5;
		yourself.

	result := self resultOfSerializeAndMaterialize: original.

	self assert: 5 equals: result