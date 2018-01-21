serialize/materialize
serializePostInstance: aTrait with: anEncoder

	anEncoder encodeReferenceTo: aTrait classSide.
		"Do not use #basicCategory because since it may be lazily computed it may happen that it is still in nil. "
	anEncoder encodeReferenceTo: aTrait category.
	anEncoder encodeReferenceTo: aTrait name.
	anEncoder encodeReferenceTo: aTrait basicEnvironment.
