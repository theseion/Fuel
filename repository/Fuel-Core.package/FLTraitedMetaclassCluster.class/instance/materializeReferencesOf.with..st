serialize/materialize
materializeReferencesOf: aMetaclass with: aDecoder
	super
		materializeReferencesOf: aMetaclass
		with: aDecoder.

	aMetaclass
		baseLocalMethods: aDecoder nextEncodedReference;
		localMethodDict: aDecoder nextEncodedReference;
		baseComposition: aDecoder nextEncodedReference;
		fuelSetTraitComposition: aDecoder nextEncodedReference