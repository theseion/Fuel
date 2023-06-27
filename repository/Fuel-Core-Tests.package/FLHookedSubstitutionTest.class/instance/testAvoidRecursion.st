tests
testAvoidRecursion
	| result original | 
	original := FLClassWithRecursiveSubstitution new index: 1.
	
	"Fail fast so the image doesn't crash if we end up in an endless loop"
	result := [ self resultOfSerializeAndMaterialize: original ]
		valueWithin: 1 second
		onTimeout: [ self fail ].
	
	self assert: result index equals: 2