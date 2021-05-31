tests
testProxyInsideObjectByTarget
	| aProxyClass result original pair |
	aProxyClass := (self classFactory silentlyNewClassWithClassVariableNames: 'target')
		duringTestCompileSilently: 'target: x  target := x';
		duringTestCompileSilently: 'fuelAccept: aVisitor  ^aVisitor visitSubstitution: self by: target';
		yourself.

	original := aProxyClass new
		target: 5;
		yourself.

	pair := FLPair new
		left: original;
		right: 'foo'.

	result := self resultOfSerializeAndMaterialize: pair.

	self assert: result left equals: 5.
	self assert: result right equals: 'foo'