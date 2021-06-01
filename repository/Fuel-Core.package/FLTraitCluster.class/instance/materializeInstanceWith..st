serialize/materialize
materializeInstanceWith: aDecoder
	| traitClass |
	traitClass := aDecoder nextEncodedReference.
	^ traitClass new