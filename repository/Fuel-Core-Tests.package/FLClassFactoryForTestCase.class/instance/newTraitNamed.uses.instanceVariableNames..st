creating-traits
newTraitNamed: aTraitName uses: aTraitComposition instanceVariableNames: aString
	| newTrait |
	newTrait := self class classInstaller make: [ :aBuilder |
		aBuilder
			environment: self environment;
			name: aTraitName;
			slots: aString asSlotCollection;
			traitComposition: aTraitComposition asTraitComposition;
			package: self defaultPackageAndTag;
			beTrait ].

	self createdTraits add: newTrait.
	^ newTrait