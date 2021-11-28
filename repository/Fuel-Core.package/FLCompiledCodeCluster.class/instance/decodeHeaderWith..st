protected
decodeHeaderWith: aDecoder
	| signBit header |
	signBit := aDecoder nextEncodedByte.
	header := aDecoder nextEncodedInt32.

	^ signBit = true asBit
		ifTrue: [ header + SmallInteger minVal ]
		ifFalse: [ header ]