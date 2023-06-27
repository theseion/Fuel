tests
testCreateWithClassTrait
	"Tests materialization of a class not defined in the image, with a class trait"
	
	| class materializedClassOrTrait aTrait |	
	aTrait := self classFactory silentlyNewTrait.
	self classFactory
		silentlyCompile: 'fortyTwo ^42'
		in: aTrait classSide.
	class := self classFactory silentlyNewClass.
	class addToComposition: aTrait.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: class.

	self assert: 1 equals: materializedClassOrTrait traits size.
	self assert: (materializedClassOrTrait traits includes: aTrait).
	self assert: (aTrait users includes: materializedClassOrTrait).
	self assert: materializedClassOrTrait classSide localSelectors isEmpty.
	self assert: 42 equals: ((self newInstanceFrom: materializedClassOrTrait) class perform: #fortyTwo)