encoding
encodeUint8: aSmallInteger 
	"Append to the receiver an Integer as the next byte."
	stream nextPut: (aSmallInteger bitAnd: 255)