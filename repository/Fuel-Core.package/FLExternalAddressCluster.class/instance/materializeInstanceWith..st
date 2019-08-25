serialize/materialize
materializeInstanceWith: aDecoder
	| size |
	size := aDecoder nextEncodedPositiveInteger.
	^ (theClass basicNew: size)
		beNull;
		yourself
