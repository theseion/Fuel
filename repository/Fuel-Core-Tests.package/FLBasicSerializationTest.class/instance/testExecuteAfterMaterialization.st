tests-fuelAfterMaterialization
testExecuteAfterMaterialization

	| anObject result aClass |
	aClass := self classFactory silentlyMake: [ :aBuilder | aBuilder slotsFromString: 'a' ].
	self classFactory silentlyCompile: 'fuelAfterMaterialization a := #A' in: aClass.
	anObject := aClass new.

	result := self resultOfSerializeAndMaterialize: anObject.

	self assert: #A equals: (result instVarNamed: 'a')