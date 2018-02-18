tests
testOnePathInNestedArray
	
	| array references expectedReferences |
	array := #(1 #(42)).
	references := (self analysisOf: array) pathsTo: 42.
	expectedReferences := Set 
		with: #(1 #(42)) -> #(42) 
		with: #(42) -> 42.
	
	self assert: references = expectedReferences.
