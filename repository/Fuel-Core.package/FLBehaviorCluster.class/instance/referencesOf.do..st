analyzing
referencesOf: aClassOrTrait do: aBlock
	aBlock
		value: aClassOrTrait methodDictionary;
		value: aClassOrTrait organization