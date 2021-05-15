tests
testNextEncodedUint24
	stream 
		nextPutAll: #[0 0 0];
		reset.
	self assert: decoder nextEncodedUint24 equals: 0.
	
	stream
		resetToStart;
		nextPutAll: #[0 0 1];
		reset.
	self assert: decoder nextEncodedUint24 equals: 1.
	
	"Maximum positive 24-bit integer in two's complement"
	stream
		resetToStart;
		nextPutAll: #[255 255 255];
		reset.
	self assert: decoder nextEncodedUint24 equals: (2 raisedTo: 24) - 1