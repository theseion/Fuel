decoding
nextEncodedUint64
	"Answer the next unsigned, 64-bit integer from this (binary) stream."

	| n |
	n := stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ n
