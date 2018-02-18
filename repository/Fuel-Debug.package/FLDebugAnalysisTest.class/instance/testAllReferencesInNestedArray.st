tests
testAllReferencesInNestedArray
	
	| array references expectedReferences |
	array := #(1 #(42)).
	references := (self analysisOf: array) references.
	expectedReferences := Set 
		with: #(1 #(42)) -> 1 
		with: #(1 #(42)) -> #(42) 
		with: #(42) -> 42.
	
	self assert: references = expectedReferences.
