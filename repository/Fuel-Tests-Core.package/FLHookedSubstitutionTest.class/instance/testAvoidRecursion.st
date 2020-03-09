tests
testAvoidRecursion
	| result original | 
	original := FLClassWithRecursiveSubstitution new index: 1.
	
	result := [ self resultOfSerializeAndMaterialize: original ]
		valueWithin: 1 second
		onTimeout: [ self fail ].
	
	self assert: result index equals: 2