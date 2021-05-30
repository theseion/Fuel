tests
testCreateWithInternalTrait
	"Tests materialization of a class not defined in the image, with a trait, both internally serialized"
	
	| aClass aTrait serializedArray materializedArray materializedClassOrTrait materializedTrait |	
	aTrait := self newTraitSuffixed: 'Secondary'.
	aTrait duringTestCompileSilently: 'fortyTwo ^42'.
	aClass := self newClass.
	aClass addToComposition: aTrait.
	serializedArray := Array with: aClass with: aTrait.

	materializedArray := self resultOfSerializeRemoveAndMaterializeAll: serializedArray.
	materializedClassOrTrait := materializedArray first.
	materializedTrait := materializedArray second.

	self assert: 1 = (materializedClassOrTrait traits size).
	self assert: (materializedClassOrTrait traits includes: materializedTrait).
	self assert: (materializedTrait users includes: materializedClassOrTrait).
	self assert: materializedClassOrTrait localSelectors isEmpty.
	
	self assert: 42 = ((self newInstanceFrom: materializedClassOrTrait) perform: #fortyTwo)