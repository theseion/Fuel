encoding
encodeInt32: aSmallInteger
	"SmallInteger is 31 / 63 bits. We could encode 32 bit signed integers in theory but
	that would mean that we could receive large integers as input, which shouldn't happen.
	We have to assume that we are storing a SmallInteger with 31 bits of information here.
	We can store the SmallInteger as a uint and then take care to restore potential higher
	bits when we materialze.
	Note: we have to mask the top bit because we don't know what was in there. Since
		we store byte units but SmallInteger is only 31 bits, the top bit may be 1 if
		the argument is negative and we're on a 64 bit system."
	self encodeUint32: (aSmallInteger bitAnd: 16r7FFFFFFF)