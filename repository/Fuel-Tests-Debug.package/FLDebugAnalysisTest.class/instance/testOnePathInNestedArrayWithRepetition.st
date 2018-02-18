tests
testOnePathInNestedArrayWithRepetition
	
	| array references expectedReferences subArray |
	subArray := Array with: 42.
	array := Array with: subArray with: subArray.
	references := (self analysisOf: array) pathsTo: 42.
	expectedReferences := Set 
		with: array -> subArray 
		with: subArray -> 42.
	
	expectedReferences do: [:expectedAssociation |
		self assert: (references anySatisfy: [:association | 
			association key == expectedAssociation key and: [association value == expectedAssociation value]])].