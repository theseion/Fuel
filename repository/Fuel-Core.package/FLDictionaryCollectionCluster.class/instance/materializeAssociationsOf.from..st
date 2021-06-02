serialize/materialize
materializeAssociationsOf: aDictionary from: aDecoder
	aDecoder nextEncodedUint32 timesRepeat: [
		aDictionary add: aDecoder nextEncodedReference ]