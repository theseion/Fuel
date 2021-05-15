tests
testNextEncodedUint32
	stream 
		nextPutAll: #[0 0 0 0];
		reset.
	self assert: decoder nextEncodedUint32 equals: 0.
	
	stream
		resetToStart;
		nextPutAll: #[0 0 0 1];
		reset.
	self assert: decoder nextEncodedUint32 equals: 1.
	
	"SmallInteger maxVal on 32-bits systems"
	stream
		resetToStart;
		nextPutAll: #[127 255 255 255];
		reset.
	self assert: decoder nextEncodedUint32 equals: (2 raisedTo: 31) - 1.
	
	"SmallInteger minVal on 64-bits systems"
	stream
		resetToStart;
		nextPutAll: #[64 0 0 0];
		reset.
	self assert: decoder nextEncodedUint32 equals: (2 raisedTo: 30)