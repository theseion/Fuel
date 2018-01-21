testing
smallintegersAndStringsSampleDictionary

	| sourceDictionary|
	sourceDictionary := dictionaryClass new.
	1 to: (1 << 19) do:  [:aNumber | sourceDictionary at: aNumber put: aNumber printString ] .
	^sourceDictionary 