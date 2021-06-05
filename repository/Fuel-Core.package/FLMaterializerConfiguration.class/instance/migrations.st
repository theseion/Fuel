as yet unclassified
migrations
	^ self
		at: #migrations
		ifAbsentPut: [ Dictionary new ]