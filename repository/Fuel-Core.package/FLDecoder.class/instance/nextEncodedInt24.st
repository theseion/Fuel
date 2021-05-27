decoding
nextEncodedInt24
	| topByte n |
	topByte := stream next.
	n := topByte bitAnd: 16r7FFFFF.
	n := (n bitShift: 8) + stream next.
	n := (n bitShift: 8) + stream next.
	^ topByte > 127
		ifTrue: [ n + (-1 bitShift: 24) ]
		ifFalse: [ n ]