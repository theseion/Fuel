serialize/materialize
serializeInstance: aClassVariable with: anEncoder
	anEncoder 
		encodeReferenceTo: aClassVariable owningClass;
		encodeReferenceTo: aClassVariable key