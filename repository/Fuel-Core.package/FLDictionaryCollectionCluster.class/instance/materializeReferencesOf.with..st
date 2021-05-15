serialize/materialize
materializeReferencesOf: anObject with: aDecoder
	aDecoder nextEncodedUint32 timesRepeat: [
		anObject add: aDecoder nextEncodedReference -> aDecoder nextEncodedReference ]