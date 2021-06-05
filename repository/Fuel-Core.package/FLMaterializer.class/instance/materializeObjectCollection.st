materializing
materializeObjectCollection
	^ self configuration streamDo: [ :stream |
		OrderedCollection streamContents: [ :collectionStream |
			[ stream atEnd ] whileFalse: [
				collectionStream nextPut: (self basicMaterializeFrom: stream) root ] ] ]