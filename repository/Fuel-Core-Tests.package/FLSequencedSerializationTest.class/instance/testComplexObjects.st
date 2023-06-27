tests
testComplexObjects
	self assertSequencedSerializationEqualityOf: {
		Class.
		FLPair.
		FLPair new
			left: 1;
			right: 2.
		FLPair methodDictionary.
		Smalltalk globals }