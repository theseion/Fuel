serialize/materialize
materializeGlobalClassFrom: aDecoder
	| class |
	class := super materializeGlobalClassFrom: aDecoder.
	^ aDecoder nextEncodedByte = 1
		ifTrue: [ class classSide ]
		ifFalse: [ class instanceSide ]