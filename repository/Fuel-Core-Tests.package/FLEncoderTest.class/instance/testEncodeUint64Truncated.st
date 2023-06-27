tests
testEncodeUint64Truncated
	encoder encodeUint64: (2 raisedTo: 64).
	self assert: self getResult equals: #[0 0 0 0 0 0 0 0].
	
	encoder encodeUint64: (2 raisedTo: 65) - 1.
	self assert: self getResult equals: #[255 255 255 255 255 255 255 255]