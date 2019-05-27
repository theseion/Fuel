traits-factory
newTraitSuffixed: suffix
	^ self classFactory
		newTraitNamed: (self traitNamePrefix, suffix) asSymbol
		uses: Array new 
		tag: self classFactory defaultTagPostfix