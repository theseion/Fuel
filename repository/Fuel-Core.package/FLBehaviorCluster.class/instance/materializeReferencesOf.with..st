serialize/materialize
materializeReferencesOf: aClassOrTrait with: aDecoder

	aClassOrTrait
		methodDictionary: aDecoder nextEncodedReference;
		protocols: aDecoder nextEncodedReference