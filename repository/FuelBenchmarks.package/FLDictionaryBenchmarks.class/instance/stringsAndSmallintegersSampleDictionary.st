testing
stringsAndSmallintegersSampleDictionary

	| sourceDictionary|
	sourceDictionary := dictionaryClass new.
	1 to: (1 << 19) do:  [:aNumber | sourceDictionary at: aNumber printString put: aNumber ] .
	^sourceDictionary 