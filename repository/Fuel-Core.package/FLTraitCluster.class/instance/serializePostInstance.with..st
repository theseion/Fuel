serialize/materialize
serializePostInstance: aTrait with: anEncoder
		"Do not use #basicCategory because since it may be lazily computed it may happen that it is still in nil. "
	anEncoder
		encodeReferenceTo: aTrait category;
		encodeReferenceTo: aTrait name;
		encodeReferenceTo: aTrait basicEnvironment;
		encodeReferenceTo: aTrait format.
	(aTrait respondsTo: #classLayout)
		ifTrue: [
			self
				serializeLayout: aTrait classLayout
				with: anEncoder ]
		ifFalse: [
			"Squeak and stateless traits"
			anEncoder encodeReferenceTo: nil ].
	anEncoder encodeString: aTrait instanceVariablesString