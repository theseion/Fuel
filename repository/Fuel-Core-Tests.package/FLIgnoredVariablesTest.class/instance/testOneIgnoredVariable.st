tests
testOneIgnoredVariable
	| anObject result aClass |
	aClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'a b c'.
	self classFactory
		silentlyCompile: 'fuelIgnoredInstanceVariableNames ^#(b)'
		in: aClass class.
	anObject := aClass new
		instVarAt: 1 put: $A;
		instVarAt: 2 put: $B;
		instVarAt: 3 put: $C;
		yourself.

	result := self resultOfSerializeAndMaterialize: anObject.

	self assert: $A equals: (result instVarAt: 1).
	self assert: nil equals: (result instVarAt: 2).
	self assert: $C equals: (result instVarAt: 3)