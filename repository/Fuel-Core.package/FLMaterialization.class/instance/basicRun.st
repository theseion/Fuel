private
basicRun
	| stream |
	self configuration hasMultipleObjects
		ifFalse: [ self runSteps ]
		ifTrue: [
			stream := self context stream.
			[ stream atEnd ] whileFalse: [
				self runSteps ] ]