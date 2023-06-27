tests-strings
testWideString
	| wideString collection |
	wideString := WideString streamContents: [ :stream |
		256
			to: 1000
			do: [ :int | stream nextPut: int asCharacter ] ].

	collection := Array
		new: 600
		streamContents: [ :stream |
			600 timesRepeat: [
				stream nextPut: wideString ] ].

	self assertSerializationEqualityOf: collection