tests
testEncodeUint24Truncated
	encoder encodeUint24: (2 raisedTo: 24).
	self assert: self getResult equals: #[0 0 0].
	
	encoder encodeUint24: (2 raisedTo: 24) - 1.
	self assert: self getResult equals: #[255 255 255]