protected
encodeHeader: aSmallInteger with: anEncoder
	"Reduce storage by storing the sign bit as the top bit of the 32 bit integer.
	We know that bit 32 is unused because SmallInteger uses 31 bits (on 32-bits systems).
	This operation is redundant on 32-bits systems but necessary on 64-bits systems since
	the sign bit will be bit 63, not 31."
	anEncoder encodeInt32: (aSmallInteger < 0
		ifTrue: [ aSmallInteger bitOr: 16r80000000 ]
		ifFalse: [ aSmallInteger ])