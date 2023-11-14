serialize/materialize
serializePostInstance: aTrait with: anEncoder

	anEncoder
		encodeReferenceTo: aTrait package name;
		encodeReferenceTo: aTrait packageTag name;
		encodeReferenceTo: aTrait name;
		encodeReferenceTo: aTrait basicEnvironment;
		encodeReferenceTo: aTrait format.

	self serializeLayout: aTrait classLayout with: anEncoder.

	anEncoder
		encodeString: aTrait instanceVariablesString;
		encodeString: aTrait comment;
		encodeString: aTrait commentStamp