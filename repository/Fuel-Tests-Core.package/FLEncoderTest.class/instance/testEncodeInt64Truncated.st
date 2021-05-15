tests
testEncodeInt64Truncated
	encoder encodeInt64: (2 raisedTo: 64).
	self assert: self getResult equals: #[0 0 0 0 0 0 0 0].
	
	encoder encodeInt64: (2 raisedTo: 65) - 1.
	self assert: self getResult equals: #[255 255 255 255 255 255 255 255]