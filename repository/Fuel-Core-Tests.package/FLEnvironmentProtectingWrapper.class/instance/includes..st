testing
includes: anObject
	^ (overlay includes: anObject) or: [
		environment includes: anObject ]