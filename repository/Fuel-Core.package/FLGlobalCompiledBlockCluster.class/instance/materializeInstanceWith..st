serialize/materialize
materializeInstanceWith: aDecoder
	| method literalIndex |
	method := aDecoder nextEncodedReference.
	literalIndex := aDecoder nextEncodedUint8.
	^ literalIndex < 1
		ifTrue: [ nil ]
		ifFalse: [ method literalsAt: literalIndex ]