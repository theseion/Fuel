encoding
encodeInt24: aSmallInteger
	"SmallInteger is 31 / 63 bits. Hence, we can store a full 24 bit signed integer.
	We only have to restore the two's complement of the remaining higher bits when
	we materialize."
	self encodeUint24: aSmallInteger