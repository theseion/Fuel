tests
testNextEncodedInt32
	stream 
		nextPutAll: #[0 0 0 0];
		reset.
	self assert: decoder nextEncodedInt32 equals: 0.
	
	stream
		resetToStart;
		nextPutAll: #[0 0 0 1];
		reset.
	self assert: decoder nextEncodedInt32 equals: 1.
	
	"-1 on 32-bits systems"
	stream
		resetToStart;
		nextPutAll: #[127 255 255 255];
		reset.
	"The decoded integer will be negative on a 32-bits system but not on 64-bits"
	self assert: decoder nextEncodedInt32 equals: (2 raisedTo: 31) - 1.
	
	"SmallInteger maxVal on 32-bits systems"
	stream
		resetToStart;
		nextPutAll: #[63 255 255 255];
		reset.
	self assert: decoder nextEncodedInt32 equals: (2 raisedTo: 30) - 1.
	
	"SmallInteger minVal on 32-bits systems"
	stream
		resetToStart;
		nextPutAll: #[64 0 0 0];
		reset.
	"The decoded integer will be negative on a 32-bits system but not on 64-bits"
	self assert: decoder nextEncodedInt32 equals: (2 raisedTo: 30)