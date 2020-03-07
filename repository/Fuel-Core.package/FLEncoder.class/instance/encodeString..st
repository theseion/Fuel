encoding
encodeString: aString
	| length |
	(length := aString size) < 192
		ifTrue: [ stream nextPut: length ]
		ifFalse: [ stream nextPut: (length byteAt: 4) + 192.
			stream nextPut: (length byteAt: 3).
			stream nextPut: (length byteAt: 2).
			stream nextPut: (length byteAt: 1) ].
	stream nextBytesPutAll: aString