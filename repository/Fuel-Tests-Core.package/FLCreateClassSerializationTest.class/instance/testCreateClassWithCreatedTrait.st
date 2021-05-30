tests
testCreateClassWithCreatedTrait
	"Tests materialization of a class and a trait not defined in the image. The class uses the trait."
	
	| aClass aTrait result materializedClass materializedTrait |	
	aClass := self newClass.
	aClass duringTestCompileSilently: 'fortyOne ^41'.
	aTrait := self newTraitSuffixed: 'Secondary'.
	aTrait duringTestCompileSilently: 'fortyTwo ^42'.
	aClass addToComposition: aTrait.
	
	result := self resultOfSerializeRemoveAndMaterializeAll: (Array with: aClass with: aTrait).
	materializedClass := result first.
	materializedTrait := result second.

	self assert: result size = 2.
	self assert: (materializedClass traits first == materializedTrait).
	self assert: (materializedTrait users includes: materializedClass).
	self assert: materializedClass localSelectors size = 1.
	self assert: (materializedClass localSelectors includes: #fortyOne).
	self assert: materializedClass traitComposition transformations isEmpty not.