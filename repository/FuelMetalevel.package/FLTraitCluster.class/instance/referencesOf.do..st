analyzing
referencesOf: aTrait do: aBlock

	super referencesOf: aTrait do: aBlock.

	aBlock value: aTrait classSide.
	aBlock value: aTrait basicEnvironment.
	aBlock value: aTrait category.
	aBlock value: aTrait name.
