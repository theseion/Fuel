tests
testOneSelectedPath
	
	| array references expectedReferences |
	array := #(42 nil).
	references := (self analysisOf: array) pathsToEvery: [:o | o isNil].
	expectedReferences := Set with: array -> nil.
	
	self assert: references = expectedReferences.
