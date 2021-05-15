tests
testEncodeUint16Truncated
	encoder encodeUint16: (2 raisedTo: 16).
	self assert: self getResult equals: #[0 0].
	
	encoder encodeUint16: (2 raisedTo: 32) - 1.
	self assert: self getResult equals: #[255 255]