decoding
nextEncodedInt32
	"SmallInteger is 31 / 63 bits.
	Look at the high bit (bit 30, not 31!) to see whether this is actually a negative
	integer and then restore the remaining two's complement bits.
	Note: we don't dispatch to #nextEncodedUint32 to avoid overflow to large integers
			when decoding negative integers."
	| n |
	n := stream next.
	"See whether bit 7 of the byte is set (= bit 31)"
	(n bitAnd: 64) = 64 ifTrue: [
		n := n + (-1 bitShift: 7) ].
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ (n bitShift: 8) + stream next