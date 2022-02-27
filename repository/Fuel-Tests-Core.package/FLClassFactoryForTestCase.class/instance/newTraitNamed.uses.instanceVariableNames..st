creating-traits
newTraitNamed: aTraitName uses: aTraitComposition instanceVariableNames: aString
	| newTrait |					
	newTrait := FLPlatform current
		newTraitNamed: aTraitName
		uses: aTraitComposition
		instanceVariableNames: aString
		environment: self environment
		package: self defaultPackageAndTag.
	
	self createdTraits add: newTrait.
	^ newTrait