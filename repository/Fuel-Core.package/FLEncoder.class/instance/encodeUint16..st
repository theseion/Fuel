encoding
encodeUint16: aSmallInteger 
	"Append to the receiver an Integer as the next 2 bytes."
	stream
		nextPut: ((aSmallInteger bitShift: -8) bitAnd: 255);
		nextPut: (aSmallInteger bitAnd: 255)