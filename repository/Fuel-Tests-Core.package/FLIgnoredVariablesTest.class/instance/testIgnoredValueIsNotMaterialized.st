tests
testIgnoredValueIsNotMaterialized

	| anObject materializedInstances aClass |
	aClass := self classFactory silentlyNewClassWithInstanceVariableNames: 'a'.
	self classFactory
		silentlyCompile: 'fuelIgnoredInstanceVariableNames ^#(a)'
		in: aClass class.
	anObject := aClass new
		instVarAt: 1 put: #A;
		yourself.

	self serialize: anObject.
	materializedInstances := self materializedObjects.

	self deny: (materializedInstances includes: #A)
