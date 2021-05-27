encoding
encodeInt24: aSmallInteger
	| topByte |
	topByte := (aSmallInteger bitShift: -16) bitAnd: 255.
	aSmallInteger < 0 ifTrue: [
		topByte := topByte bitOr: 128 ].
	
	stream
		nextPut: topByte;
		nextPut: ((aSmallInteger bitShift: -8) bitAnd: 255);
		nextPut: (aSmallInteger bitAnd: 255)