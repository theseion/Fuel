decoding
nextEncodedInt64
	"SmallInteger is 31 / 63 bits.
	Look at the high bit (bit 61, not 63!) to see whether this is actually a negative
	integer and then restore the remaining two's complement bits.
	Note: we don't dispatch to #nextEncodedUint64 to avoid overflow to large integers
			when decoding negative integers.
	Note: while the documentation says that SmallInteger uses 63 bits on 64 bit platforms
			`SmallInteger minVal` actually only uses 61 bits!"
	| n |
	n := stream next.
	"See whether bit 5 of the byte is set (= bit 61)"
	(n bitAnd: 16) = 16 ifTrue: [
		n := n + (-1 bitShift: 5) ].
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ (n bitShift: 8) + stream next