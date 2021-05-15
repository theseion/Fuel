tests
testNextEncodedUint8
	stream 
		nextPutAll: #[0];
		reset.
	self assert: decoder nextEncodedUint8 equals: 0.
	
	stream
		resetToStart;
		nextPutAll: #[1];
		reset.
	self assert: decoder nextEncodedUint8 equals: 1.
	
	"Maximum positive 8-bit integer in two's complement"
	stream
		resetToStart;
		nextPutAll: #[255];
		reset.
	self assert: decoder nextEncodedUint8 equals: (2 raisedTo: 8) - 1