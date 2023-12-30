analyzing
referencesOf: aMetaclass do: aBlock
	super
		referencesOf: aMetaclass
		do: aBlock.
	
	aBlock
		value: aMetaclass baseLocalMethods;
		value: aMetaclass localMethodDict;
		value: aMetaclass baseComposition;
		value: aMetaclass fuelGetTraitComposition