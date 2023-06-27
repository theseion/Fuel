tests
testEncodeUInt8
	encoder encodeUint8: 0.
	self assert: self getResult equals: #[0].
	
	encoder encodeUint8: 1.
	self assert: self getResult equals: #[1].
	
	"Maximum positive 8-bit integer"
	encoder encodeUint8: (2 raisedTo: 8) - 1.
	self assert: self getResult equals: #[255]