tests-strings
testWideString
	self assertSerializationEqualityOf: 'aString' asWideString.
	self assertSerializationEqualityOf: (WideString
		streamContents: [ :stream |
			2000 timesRepeat: [
				stream nextPut: (256 to: 1000) atRandom asCharacter ] ])