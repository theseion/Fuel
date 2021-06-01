serialize/materialize
serializePostInstance: aMetaclass with: anEncoder

	anEncoder encodeReferenceTo: aMetaclass superclass.
	anEncoder encodeString: (self instanceVariablesStringFor: aMetaclass).
	anEncoder encodeUint24: aMetaclass format.
	self
		serializeLayout: aMetaclass classLayout
		with: anEncoder