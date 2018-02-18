analyzing
referencesOf: aMetaclass do: aBlock

	super referencesOf: aMetaclass do: aBlock.
	aBlock value: aMetaclass classLayout class.
	
	aBlock value: aMetaclass superclass.