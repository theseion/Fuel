tests
testCreateWithMethod
	"Tests materialization of a compiled method in a class not defined in the image."
	
	| aClassOrTrait materializedClassOrTrait category |
	category := 'category-for-fuel-tests'.
	aClassOrTrait := self newClassOrTrait.
	self classFactory
		silentlyCompile: 'fortyTwo ^42'
		in: aClassOrTrait
		category: category.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self assert: (materializedClassOrTrait includesSelector: #fortyTwo).
	self assertCollection: #(fortyTwo) hasSameElements: materializedClassOrTrait localSelectors.
	self assert: category equals: (materializedClassOrTrait whichCategoryIncludesSelector: #fortyTwo).
	self assert: 42 equals: ((self newInstanceFrom: materializedClassOrTrait) perform: #fortyTwo).