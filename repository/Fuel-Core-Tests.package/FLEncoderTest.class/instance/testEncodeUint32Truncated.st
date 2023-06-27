tests
testEncodeUint32Truncated
	encoder encodeUint32: (2 raisedTo: 32).
	self assert: self getResult equals: #[0 0 0 0].
	
	encoder encodeUint32: (2 raisedTo: 64) - 1.
	self assert: self getResult equals: #[255 255 255 255]