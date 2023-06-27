tests
testSpecialObjectsArray
	| result |
	result := self resultOfSerializeAndMaterialize: Smalltalk specialObjectsArray.
	
	self assert: result isNil