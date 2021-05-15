tests
testEncodeUint16
	encoder encodeUint16: 0.
	self assert: self getResult equals: #[0 0].
	
	encoder encodeUint16: 1.
	self assert: self getResult equals: #[0 1].
	
	"Maximum positive 16-bit integer"
	encoder encodeUint16: (2 raisedTo: 16) - 1.
	self assert: self getResult equals: #[255 255]