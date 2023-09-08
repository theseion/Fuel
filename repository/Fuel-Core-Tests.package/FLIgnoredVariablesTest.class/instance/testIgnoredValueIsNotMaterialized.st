tests
testIgnoredValueIsNotMaterialized

	| anObject materialized aClass |
	aClass := self classFactory make: [ :aBuilder | aBuilder slotsFromString: 'a' ].
	self classFactory silentlyCompile: 'fuelIgnoredInstanceVariableNames ^#(a)' in: aClass class.
	anObject := aClass new
		            instVarAt: 1 put: #A;
		            yourself.

	self serialize: anObject.
	materialized := self materialized.

	self deny: (materialized instVarAt: 1) identicalTo: #A