serialize/materialize
materializeInstanceWith: aDecoder
	| size |
	size := aDecoder nextEncodedUint32.
	^ (theClass basicNew: size)
		beNull;
		yourself