tests
testProxyInsideObjectByTarget

	| aProxyClass result original pair |
	aProxyClass := self classFactory silentlyMake: [ :aBuilder | aBuilder sharedVariablesFromString: 'Target' ].
	self classFactory
		silentlyCompile: 'target: x  Target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: Target'
		in: aProxyClass.

	original := aProxyClass new
		            target: 5;
		            yourself.

	pair := FLPair new
		        left: original;
		        right: 'foo'.

	result := self resultOfSerializeAndMaterialize: pair.

	self assert: result left equals: 5.
	self assert: result right equals: 'foo'