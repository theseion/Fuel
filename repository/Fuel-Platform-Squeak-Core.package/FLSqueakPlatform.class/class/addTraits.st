private-hacks
addTraits
	(Smalltalk classOrTraitNamed: #TClass) ifNil: [
		Trait 
			named: #TClass
			uses: {}
			category: self hacksCategoryName ].

	(Smalltalk classOrTraitNamed: #TApplyingOnClassSide) ifNil: [
		Trait 
			named: #TApplyingOnClassSide
			uses: {}
			category: self hacksCategoryName ]