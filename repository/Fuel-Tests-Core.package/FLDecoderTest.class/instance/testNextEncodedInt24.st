tests
testNextEncodedInt24
	stream 
		nextPutAll: #[0 0 0];
		reset.
	self assert: decoder nextEncodedInt24 equals: 0.
	
	stream
		resetToStart;
		nextPutAll: #[0 0 1];
		reset.
	self assert: decoder nextEncodedInt24 equals: 1.
	
	"-1 in two's complement"
	stream
		resetToStart;
		nextPutAll: #[255 255 255];
		reset.
	self assert: decoder nextEncodedInt24 equals: (2 raisedTo: 24) - 1.
	
	"Maximum positive 24-bit integer in two's complement"
	stream
		resetToStart;
		nextPutAll: #[127 255 255];
		reset.
	self assert: decoder nextEncodedInt24 equals: (2 raisedTo: 23) - 1.
	
	"Minimum negative 24-bit integer in two's complement"
	stream
		resetToStart;
		nextPutAll: #[128 0 0 0];
		reset.
	self assert: decoder nextEncodedInt24 equals: (2 raisedTo: 23)