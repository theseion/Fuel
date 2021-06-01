tests
testCreateWithExternalTrait
	"Tests materialization of a class not defined in the image, with a trait"
	
	| aClassOrTrait materializedClassOrTrait aTrait |	
	aTrait := self classFactory silentlyNewTrait.
	self classFactory
		silentlyCompile:  'fortyTwo ^42'
		in: aTrait.
	aClassOrTrait := self classFactory silentlyNewClass.
	aClassOrTrait addToComposition: aTrait.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClassOrTrait.

	self assert: 1 equals: materializedClassOrTrait traits size.
	self assert: (materializedClassOrTrait traits includes: aTrait).
	self assert: (aTrait users includes: materializedClassOrTrait).
	self assert: materializedClassOrTrait localSelectors isEmpty.
	self assert: 42 equals: ((self newInstanceFrom: materializedClassOrTrait) perform: #fortyTwo)