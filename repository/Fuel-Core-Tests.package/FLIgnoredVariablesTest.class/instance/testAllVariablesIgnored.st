tests
testAllVariablesIgnored

	| anObject result aClass |
	aClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'a b'.
	self classFactory
		silentlyCompile: 'fuelIgnoredInstanceVariableNames ^#(a b)'
		in: aClass class.
	anObject := aClass new
		instVarAt: 1 put: $A;
		instVarAt: 2 put: $B;
		yourself.

	result := self resultOfSerializeAndMaterialize: anObject.

	self assert: (result instVarAt: 1) isNil.
	self assert: (result instVarAt: 2) isNil.