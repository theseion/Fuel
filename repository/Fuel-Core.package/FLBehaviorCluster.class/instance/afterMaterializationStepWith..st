serialize/materialize
afterMaterializationStepWith: aDecoder
	objects do:	[ :aClassOrTrait |
		aClassOrTrait
			fuelRecomputeSlotScopeWithTraits;
			fuelInitializeTraitComposition ]