tests
testEncodeInt24Truncated
	encoder encodeInt24: (2 raisedTo: 24).
	self assert: self getResult equals: #[0 0 0].
	
	encoder encodeInt24: (2 raisedTo: 32) - 1.
	self assert: self getResult equals: #[255 255 255]