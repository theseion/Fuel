traits-factory
newTraitNamed: traitName inCategory: aCategory
	^ self classFactory
		newTraitNamed: traitName asSymbol
		uses: Array new 
		category: aCategory asSymbol