tests
testEncodeInt32Truncated
	encoder encodeInt32: (2 raisedTo: 32).
	self assert: self getResult equals: #[0 0 0 0].
	
	encoder encodeInt32: (2 raisedTo: 64) - 1.
	self assert: self getResult equals: #[127 255 255 255]