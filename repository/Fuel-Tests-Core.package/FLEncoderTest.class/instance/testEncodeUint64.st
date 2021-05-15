tests
testEncodeUint64
	encoder encodeUint64: 0.
	self assert: self getResult equals: #[0 0 0 0 0 0 0 0].
	
	encoder encodeUint64: 1.
	self assert: self getResult equals: #[0 0 0 0 0 0 0 1].
	
	"Maximum positive 64-bit integer"
	encoder encodeUint64: (2 raisedTo: 63) - 1.
	self assert: self getResult equals: #[127 255 255 255 255 255 255 255]