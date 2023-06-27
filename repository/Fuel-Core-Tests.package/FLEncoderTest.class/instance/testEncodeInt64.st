tests
testEncodeInt64
	"Note: SmallInteger in Pharo is 31 / 63 bits wide and stored in two's complement format.
			 Hence, the largest positive values are 2^30 - 1 and 2^62 - 1, the smallest negative
			 values -2^30 and -2^63, respectively."
	encoder encodeInt64: 0.
	self assert: self getResult equals: #[0 0 0 0 0 0 0 0].
	
	encoder encodeInt64: 1.
	self assert: self getResult equals: #[0 0 0 0 0 0 0 1].
	
	"-1 on 64-bits systems"
	encoder encodeInt64: -1.
	self assert: self getResult equals: #[31 255 255 255 255 255 255 255].
	
	"SmallInteger maxVal on 32-bits systems"
	encoder encodeInt64: (2 raisedTo: 60) - 1.
	self assert: self getResult equals: #[15 255 255 255 255 255 255 255].
	
	"SmallInteger minVal on 64-bits systems"
	encoder encodeInt64: 0 - (2 raisedTo: 60).
	self assert: self getResult equals: #[16 0 0 0 0 0 0 0]