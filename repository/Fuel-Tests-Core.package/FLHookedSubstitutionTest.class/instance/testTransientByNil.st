tests
testTransientByNil
	| result aClassOfTransientObjects | 
	aClassOfTransientObjects := self classFactory silentlyNewClass
		duringTestCompileSilently: 'fuelAccept: aVisitor  ^aVisitor visitSubstitution: self by: nil';
		yourself.

	result := self resultOfSerializeAndMaterialize: aClassOfTransientObjects new.
	
	self assert: result isNil