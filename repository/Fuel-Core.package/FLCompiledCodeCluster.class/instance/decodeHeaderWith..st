protected
decodeHeaderWith: aDecoder
	"Read the sign bit and remove it from the integer since SmallInteger only
	uses 31 bits.
	Finally, set the sign bit properly, respecting word size.
	See #encodeHeader:with:"
	| header signBit |
	header := aDecoder nextEncodedInt32.
	signBit := header bitShift: -31.
	^ signBit = 1
		ifTrue: [ (header bitAnd: 16r7FFFFFFF) + SmallInteger minVal ]
		ifFalse: [ header ]
