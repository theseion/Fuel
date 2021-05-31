creating-traits
newTraitNamed: aTraitName uses: aTraitComposition
	| newTrait |					
	newTrait := self class classInstaller make: [ :aBuilder |
		aBuilder 
			name: aTraitName;
			traitComposition: aTraitComposition asTraitComposition;
			package: self defaultPackageAndTag;
			beTrait ].					
					
	self createdTraits add: newTrait.
	^ newTrait