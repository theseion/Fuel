serialize/materialize
materializeKeysAndValuesOf: aDictionary from: aDecoder
	aDecoder nextEncodedUint32 timesRepeat: [
		aDictionary add: aDecoder nextEncodedReference -> aDecoder nextEncodedReference ]