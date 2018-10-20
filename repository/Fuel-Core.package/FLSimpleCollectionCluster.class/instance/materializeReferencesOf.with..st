serialize/materialize
materializeReferencesOf: anObject with: aDecoder
	aDecoder nextEncodedPositiveInteger timesRepeat: [
		anObject add: aDecoder nextEncodedReference ]