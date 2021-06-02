serialize/materialize
encodeExtraInformationForReferencesFor: aDictionary with: anEncoder
	anEncoder encodeByte: (self hasRealAssociations: aDictionary) asBit