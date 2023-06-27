tests
testTwoPathsInNestedArray
	
	| array references expectedReferences |
	array := #(42 #(42)).
	references := (self analysisOf: array) pathsTo: 42.
	expectedReferences := Set 
		with: #(42 #(42)) -> 42 
		with: #(42 #(42)) -> #(42) 
		with: #(42) -> 42.
	
	self assert: references = expectedReferences.
