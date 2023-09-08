tests
testCreateWithClassSideMethod
	"Tests materialization of a class-side method in a class or trait not defined in the image."

	| aClassOrTrait materializedClassOrTrait category |
	category := 'tests-class-side'.
	aClassOrTrait := self newClassOrTrait.
	self classFactory
		silentlyCompile:  'fortyTwo ^42'
		in: aClassOrTrait classSide
		protocol: category.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self assert: (materializedClassOrTrait classSide includesSelector: #fortyTwo).
	self assertCollection: #(fortyTwo) hasSameElements: materializedClassOrTrait classSide localSelectors.
	self assert: category equals: (materializedClassOrTrait classSide protocolNameOfSelector: #fortyTwo).
	self assert: 42 equals: ((self newInstanceFrom: materializedClassOrTrait) class perform: #fortyTwo)