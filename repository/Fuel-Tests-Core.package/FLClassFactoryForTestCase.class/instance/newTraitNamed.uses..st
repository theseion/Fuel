creating-traits
newTraitNamed: aTraitName uses: aTraitComposition
	| newTrait |					
	newTrait := FLPlatform current
		newTraitNamed: aTraitName
		uses: aTraitComposition
		environment: self environment
		package: self defaultPackageAndTag.
	
	self createdTraits add: newTrait.
	^ newTrait