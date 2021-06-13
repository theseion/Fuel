serialize/materialize
materializeGlobalClassFrom: aDecoder
	| class |
	class := super materializeGlobalClassFrom: aDecoder.
	^ aDecoder nextEncodedByte = true asBit
		ifTrue: [ class classSide ]
		ifFalse: [ class instanceSide ]