protected
decodeHeaderWith: aDecoder
	| signBit header |
	signBit := aDecoder nextEncodedByte.
	header := aDecoder nextEncodedInt32.

	^ signBit = 1
		ifTrue: [ header + SmallInteger minVal ]
		ifFalse: [ header ]