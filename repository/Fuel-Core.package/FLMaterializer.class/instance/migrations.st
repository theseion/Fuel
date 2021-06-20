accessing
migrations
	^ map
		at: #migrations
		ifAbsentPut: [ OrderedCollection new ]