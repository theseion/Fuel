materializing
materializeObjectCollection
	| stream |
	stream := self context stream.
	^ OrderedCollection streamContents: [ :collectionStream |
		[ stream atEnd ] whileFalse: [
			collectionStream nextPut: self basicMaterialize root ] ]