tests
testEncodeUint32
	encoder encodeUint32: 0.
	self assert: self getResult equals: #[0 0 0 0].
	
	encoder encodeUint32: 1.
	self assert: self getResult equals: #[0 0 0 1].
	
	"Maximum positive 32-bit integer"
	encoder encodeUint32: (2 raisedTo: 32) - 1.
	self assert: self getResult equals: #[255 255 255 255]