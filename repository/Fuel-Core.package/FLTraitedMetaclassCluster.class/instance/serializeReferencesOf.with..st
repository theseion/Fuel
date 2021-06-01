serialize/materialize
serializeReferencesOf: aMetaclass with: anEncoder
	super
		serializeReferencesOf: aMetaclass
		with: anEncoder.
		
	anEncoder
		encodeReferenceTo: aMetaclass baseLocalMethods;
		encodeReferenceTo: aMetaclass localMethodDict;
		encodeReferenceTo: aMetaclass baseComposition;
		encodeReferenceTo: aMetaclass traitComposition