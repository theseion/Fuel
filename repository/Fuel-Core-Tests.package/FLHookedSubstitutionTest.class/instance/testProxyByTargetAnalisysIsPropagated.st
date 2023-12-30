tests
testProxyByTargetAnalisysIsPropagated

	| aProxyClass result pair original |
	aProxyClass := self classFactory silentlyMake: [ :aBuilder | aBuilder sharedVariables: #(Target) ].
	self classFactory
		silentlyCompile: 'target: x  Target := x' in: aProxyClass;
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor
				visitSubstitution: self
				by: Target'
		in: aProxyClass.

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