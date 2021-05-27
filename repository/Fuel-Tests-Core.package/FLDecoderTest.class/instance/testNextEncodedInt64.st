tests
testNextEncodedInt64
	stream 
		nextPutAll: #[0 0 0 0 0 0 0 0];
		reset.
	self assert: decoder nextEncodedInt64 equals: 0.
	
	stream
		resetToStart;
		nextPutAll: #[0 0 0 0 0 0 0 1];
		reset.
	self assert: decoder nextEncodedInt64 equals: 1.
	
	"-1 on 64-bits systems"
	stream
		resetToStart;
		nextPutAll: #[31 255 255 255 255 255 255 255];
		reset.
	self assert: decoder nextEncodedInt64 equals: -1.
	
	"SmallInteger maxVal on 64-bits systems"
	stream
		resetToStart;
		nextPutAll: #[15 255 255 255 255 255 255 255];
		reset.
	self assert: decoder nextEncodedInt64 equals: (2 raisedTo: 60) - 1.
	
	"SmallInteger minVal on 64-bits systems"
	stream
		resetToStart;
		nextPutAll: #[16 0 0 0 0 0 0 0];
		reset.
	self assert: decoder nextEncodedInt64 equals: 0 - (2 raisedTo: 60)