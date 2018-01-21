serialize/materialize
serializePostInstance: aMetaclass with: anEncoder

	anEncoder encodeReferenceTo: aMetaclass superclass.
	anEncoder encodeString: aMetaclass instanceVariablesString.
	anEncoder encodeUint24: aMetaclass format.
	self
		serializeLayout: aMetaclass classLayout
		with: anEncoder