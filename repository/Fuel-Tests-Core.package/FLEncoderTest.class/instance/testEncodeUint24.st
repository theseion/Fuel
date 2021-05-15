tests
testEncodeUint24
	encoder encodeUint24: 0.
	self assert: self getResult equals: #[0 0 0].
	
	encoder encodeUint24: 1.
	self assert: self getResult equals: #[0 0 1].
	
	"Maximum positive 24-bit integer"
	encoder encodeUint24: (2 raisedTo: 24) - 1.
	self assert: self getResult equals: #[255 255 255]