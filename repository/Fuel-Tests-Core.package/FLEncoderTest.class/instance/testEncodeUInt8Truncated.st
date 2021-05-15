tests
testEncodeUInt8Truncated
	encoder encodeUint8: (2 raisedTo: 8).
	self assert: self getResult equals: #[0].
	
	encoder encodeUint8: (2 raisedTo: 16) - 1.
	self assert: self getResult equals: #[255]