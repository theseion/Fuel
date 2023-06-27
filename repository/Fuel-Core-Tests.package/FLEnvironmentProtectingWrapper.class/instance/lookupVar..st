lookup
lookupVar: aString
	^ (overlay lookupVar: aString) ifNil: [
		environment lookupVar: aString ]