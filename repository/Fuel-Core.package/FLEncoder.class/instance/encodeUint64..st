encoding
encodeUint64: aSmallInteger 
	"Append to the receiver an Integer as the next 8 bytes."
	stream	
		nextPut: ((aSmallInteger bitShift: -56) bitAnd: 255);
		nextPut: ((aSmallInteger bitShift: -48) bitAnd: 255);
		nextPut: ((aSmallInteger bitShift: -40) bitAnd: 255);
		nextPut: ((aSmallInteger bitShift: -32) bitAnd: 255);
		nextPut: ((aSmallInteger bitShift: -24) bitAnd: 255);
		nextPut: ((aSmallInteger bitShift: -16) bitAnd: 255);
		nextPut: ((aSmallInteger bitShift: -8) bitAnd: 255);
		nextPut: (aSmallInteger bitAnd: 255)
