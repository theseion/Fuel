accessing
stream
	^ map
		at: #stream
		ifAbsentPut: [ self configuration streamFactory value ]