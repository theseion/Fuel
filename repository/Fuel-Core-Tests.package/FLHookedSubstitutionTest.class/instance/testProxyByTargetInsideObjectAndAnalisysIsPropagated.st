tests
testProxyByTargetInsideObjectAndAnalisysIsPropagated

	| aProxyClass result original pair pairRoot |
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