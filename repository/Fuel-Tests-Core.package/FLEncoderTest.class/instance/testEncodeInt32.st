tests
testEncodeInt32
	"Note: SmallInteger in Pharo is 31 / 63 bits wide and stored in two's complement format.
			 Hence, the largest positive values are 2^30 - 1 and 2^62 - 1, the smallest negative
			 values -2^30 and -2^63, respectively."
	encoder encodeInt32: 0.
	self assert: self getResult equals: #[0 0 0 0].
	
	encoder encodeInt32: 1.
	self assert: self getResult equals: #[0 0 0 1].
	
	"-1 on 32-bits systems"
	encoder encodeInt32: (2 raisedTo: 31) - 1.
	self assert: self getResult equals: #[127 255 255 255].
	
	"SmallInteger maxVal on 32-bits systems"
	encoder encodeInt32: (2 raisedTo: 30) - 1.
	self assert: self getResult equals: #[63 255 255 255].
	
	"SmallInteger minVal on 32-bits systems"
	encoder encodeInt32: (2 raisedTo: 30).
	self assert: self getResult equals: #[64 0 0 0]