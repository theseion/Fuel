serialize/materialize
materializeReferencesOf: aClassOrTrait with: aDecoder
	aClassOrTrait
		methodDictionary: aDecoder nextEncodedReference;
		organization: aDecoder nextEncodedReference