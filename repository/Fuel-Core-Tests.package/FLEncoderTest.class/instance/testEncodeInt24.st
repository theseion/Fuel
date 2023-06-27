tests
testEncodeInt24
	encoder encodeInt24: 0.
	self assert: self getResult equals: #[0 0 0].
	
	encoder encodeInt24: 1.
	self assert: self getResult equals: #[0 0 1].
	
	"-1 in two's complement"
	encoder encodeInt24: (2 raisedTo: 23) - 1.
	self assert: self getResult equals: #[127 255 255].
	
	"Maximum positive 24-bit integer in two's complement"
	encoder encodeInt24: (2 raisedTo: 22) - 1.
	self assert: self getResult equals: #[63 255 255].
	
	"Minimum negative 24-bit integer in two's complement"
	encoder encodeInt24: (2 raisedTo: 22).
	self assert: self getResult equals: #[64 0 0]