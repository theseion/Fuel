tests
testTransientByNil
	| result aClassOfTransientObjects | 
	aClassOfTransientObjects := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'fuelAccept: aVisitor
			^ aVisitor visitSubstitution: self by: nil'
		in: aClassOfTransientObjects.

	result := self resultOfSerializeAndMaterialize: aClassOfTransientObjects new.
	
	self assert: result isNil