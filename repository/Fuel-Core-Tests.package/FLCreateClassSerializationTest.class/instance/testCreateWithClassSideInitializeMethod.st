tests
testCreateWithClassSideInitializeMethod
	"Tests materialization of a class-side #initialize method in a class or trait not defined in the image. It makes sure that Fuel doesn't call it automatically"

	| aClassOrTrait materializedClassOrTrait category |
	category := 'tests-initialize'.
	aClassOrTrait := self classFactory silentlyNewClass.
	self classFactory
		silentlyCompile: 'initialize
			self error: ''Fuel should not automatically call #initialize'''
		in: aClassOrTrait classSide
		protocol: category.

	self
		shouldnt: [ materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait ]
		raise: Error.
	self
		should: [ (self newInstanceFrom: materializedClassOrTrait) class perform: #initialize ]
		raise: Error
		description: 'Fuel should not automatically call #initialize'.

	self assert: (materializedClassOrTrait classSide includesSelector: #initialize).
	self assertCollection: #(initialize) hasSameElements: materializedClassOrTrait classSide localSelectors.
	self assert: category equals: (materializedClassOrTrait classSide protocolNameOfSelector: #initialize)