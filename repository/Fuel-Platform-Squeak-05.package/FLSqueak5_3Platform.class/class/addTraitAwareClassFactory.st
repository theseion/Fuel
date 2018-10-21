private-hacks
addTraitAwareClassFactory
	Smalltalk
		at: #FLTraitAwareClassFactoryForTestCase
		ifPresent: [ :x | ^ self ].
	
	ClassFactoryForTestCase subclass: #FLTraitAwareClassFactoryForTestCase
		instanceVariableNames: 'createdTraits'
		classVariableNames: ''
		poolDictionaries: ''
		category: self hacksCategoryName.
		
	(Smalltalk at: #FLTraitAwareClassFactoryForTestCase)
		compile: 'newTraitNamed: aTraitName uses: aTraitComposition category: aCategory
	| newTrait |
	
	newTrait := Trait 
					named: aTraitName
					uses: aTraitComposition 
					category: (self packageName, ''-'', aCategory) asSymbol.
		
	self createdTraits add: newTrait.
	
	^newTrait.';
	
		compile: 'createdTraits
	^createdTraits';
	
		compile: 'deleteTraits
	self createdTraits do: [:trait|
		self delete: trait]';
	
		compile: 'createdTraitNames
	^self createdTraits collect: [:trait | trait name]';
	
		compile: 'initialize
	super initialize.
	createdTraits := IdentitySet new.';
		
		compile: 'cleanUp
	| createdClassNames createdTraitNames |
	createdClassNames := self createdClassNames.
	createdTraitNames := self createdTraitNames.
	self deleteClasses.
	self deleteTraits.
	self deletePackage.
	self cleanUpChangeSetForClassNames: createdClassNames.
	self cleanUpChangeSetForClassNames: createdTraitNames'
	