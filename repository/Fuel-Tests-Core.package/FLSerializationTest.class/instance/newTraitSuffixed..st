traits-factory
newTraitSuffixed: suffix
	^ self classFactory
		newTraitNamed: (self traitNamePrefix, suffix) asSymbol
		uses: Array new 
		category: (self classFactory packageName, '-', self classFactory defaultCategoryPostfix) asSymbol