accessing
migrations
	^ map
		at: #migrations
		ifAbsentPut: [ Dictionary new ]