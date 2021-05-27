protected
encodeHeader: aSmallInteger with: anEncoder
	"Store the sign bit separately. We can't encoded it within the 32 bit integer because the
	high bit will be truncated.
	See #encodeInt32:."
	anEncoder
		encodeByte: (aSmallInteger < 0
			ifTrue: [ 1 ]
			ifFalse: [ 0 ]);
		encodeInt32: aSmallInteger