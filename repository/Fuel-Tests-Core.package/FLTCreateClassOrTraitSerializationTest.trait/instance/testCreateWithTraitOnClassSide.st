tests
testCreateWithTraitOnClassSide
	"Tests materialization of a class not defined in the image, with a trait added to its class side"
	
	| aClass materializedClassOrTrait aTrait |	
	aTrait := self classFactory silentlyNewTrait.
	aTrait duringTestCompileSilently: 'fortyTwo ^42'.
	aClass := self classFactory silentlyNewClass.
	aClass classSide addToComposition: aTrait.

	materializedClassOrTrait := self resultOfSerializeRemoveAndMaterialize: aClass.

	self assert: 1 = materializedClassOrTrait classSide traits size.
	self assert: (materializedClassOrTrait classSide traits includes: aTrait).
	self assert: (aTrait users includes: materializedClassOrTrait classSide).
	self assert: materializedClassOrTrait classSide localSelectors isEmpty.
	self assert: 42 = ((self newInstanceFrom: materializedClassOrTrait) class perform: #fortyTwo).