encoding
encodeInt64: aSmallInteger 

	"Write a signed integer to the next 8 bytes"
	| pos |
	pos := aSmallInteger < 0
		ifTrue: [((0-aSmallInteger) bitXor: 16rFFFFFFFFFFFFFFFF) + 1]
		ifFalse: [aSmallInteger].

	1 to: 8 do: [:i | stream nextPut: (pos byteAt: 9-i)].
