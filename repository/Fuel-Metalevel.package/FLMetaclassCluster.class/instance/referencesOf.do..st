analyzing
referencesOf: aMetaclass do: aBlock
	super
		referencesOf: aMetaclass
		do: aBlock.
	
	aBlock
		value: aMetaclass classLayout class;
		value: aMetaclass superclass