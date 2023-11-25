tests
testCreateClassWithClassVariable
	"Tests materialization a class not defined in the image, with a class variable."

	| aClass materializedClass |
	aClass := self classFactory make: [ :aBuilder | aBuilder sharedVariablesFromString: #ClassVariable ].
	(aClass classVariableNamed: #ClassVariable) write: #test.

	materializedClass := self resultOfSerializeRemoveAndMaterialize: aClass.

	self assert: 1 equals: materializedClass classVarNames size.
	self assert: (materializedClass classVarNames includes: #ClassVariable).
	self assert: #test equals: (materializedClass readClassVariableNamed: #ClassVariable).
	self assert: materializedClass classVariables first class identicalTo: ClassVariable