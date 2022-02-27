analyzing
referencesOf: aTrait do: aBlock
	super referencesOf: aTrait do: aBlock.

	aBlock
		value: aTrait classSide;
		value: aTrait basicEnvironment;
		value: aTrait category;
		value: aTrait name;
		value: aTrait format;
		value: aTrait classLayout class