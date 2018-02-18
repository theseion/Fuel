tests
testTwoSelectedPaths
	
	| array references expectedReferences |
	array := #(42 nil 1).
	references := (self analysisOf: array) pathsToEvery: [:o | o isNumber].
	expectedReferences := Set with: array -> 42 with: array -> 1.
	
	self assert: references = expectedReferences.
