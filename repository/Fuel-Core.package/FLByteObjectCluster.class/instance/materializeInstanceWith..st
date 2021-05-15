serialize/materialize
materializeInstanceWith: aDecoder
	| instance size |
	size := aDecoder nextEncodedUint32.
	instance := theClass basicNew: size.
	aDecoder nextEncodedBytesInto: instance.
	^ instance
