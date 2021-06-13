materializing
basicRun
	| stream |
	self configuration hasMultipleObjects
		ifFalse: [ self runSteps ]
		ifTrue: [
			stream := self context stream.
			root := Array
				new: 1
				streamContents: [ :collectionStream |
					[ stream atEnd ] whileFalse: [
						self runSteps.
						collectionStream nextPut: root ] ] ]