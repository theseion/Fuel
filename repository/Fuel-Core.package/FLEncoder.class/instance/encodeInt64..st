encoding
encodeInt64: aSmallInteger
	"Write a signed integer to the next 8 bytes.
	
	Note: In Pharo SmallIntegers are signed 31-bit / 63-bit numbers stored
			in memory as twos' complement. For storage we can pretend that
			they are unsigned, as long as we decode them as signed.
	Note: 	Integers of larger word size are truncated, which is necessary in case of negative
			numbers (this may change the perceived value).
			This may result in the creation of a LargeInteger in case of `SmallInteger maxVal`.
			We assume that doesn't happen often and thus won'	impact performance much."

	self encodeUint64: (aSmallInteger bitAnd: 16rFFFFFFFFFFFFFFFF)