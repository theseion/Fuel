accessing
stream
	^ self
		at: #stream
		ifAbsentPut: [ self configuration streamFactory value ]