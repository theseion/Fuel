tests
testCreateWithClassTrait
	"Tests materialization of a class not defined in the image, with a class trait"
	
	| class materializedClassOrTrait aTrait |	
	aTrait := self newTraitSuffixed: 'FortyTwo'.
	aTrait classSide duringTestCompileSilently: 'fortyTwo ^42'.
	class := self newClass.
	class addToComposition: aTrait.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: class.

	self assert: 1 = materializedClassOrTrait traits size.
	self assert: (materializedClassOrTrait traits includes: aTrait).
	self assert: (aTrait users includes: materializedClassOrTrait).
	self assert: materializedClassOrTrait classSide localSelectors isEmpty.
	self assert: 42 = ((self newInstanceFrom: materializedClassOrTrait) class perform: #fortyTwo).