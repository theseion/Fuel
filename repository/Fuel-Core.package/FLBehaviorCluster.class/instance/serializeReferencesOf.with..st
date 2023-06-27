serialize/materialize
serializeReferencesOf: aClassOrTrait with: anEncoder

	anEncoder
		encodeReferenceTo: aClassOrTrait methodDictionary;
		encodeReferenceTo: aClassOrTrait protocols