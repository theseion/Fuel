decoding
nextEncodedInt32
	| topByte n |
	topByte := stream next.
	n := topByte bitAnd: 16r7FFFFFFF.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ topByte > 127
		ifTrue: [ n + (-1 bitShift: 32) ]
		ifFalse: [ n ]