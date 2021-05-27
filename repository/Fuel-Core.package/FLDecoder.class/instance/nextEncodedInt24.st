decoding
nextEncodedInt24
	"SmallInteger is 31 / 63 bits. Hence, we can store a full 24 bit signed integer.
	Look at the high bit to see whether this is actually a negative integer and then
	restore the remaining two's complement bits."
	| uInt |
	uInt := self nextEncodedUint24.
	^ (uInt bitShift: -23) = 1
		ifTrue: [ uInt + (-1 bitShift: 24) ]
		ifFalse: [ uInt ]