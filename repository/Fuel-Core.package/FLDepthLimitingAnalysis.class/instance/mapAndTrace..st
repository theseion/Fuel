mapping
mapAndTrace: anObject
	objectStack size - previousStackSize >= 0
		ifTrue: [ depth := depth + 1 ].
	previousStackSize := objectStack size.
	
	(anObject notNil and: [
		depth  > depthLimit])
			ifTrue: [
				firstMapper
					visitSubstitution: anObject
					by: nil ]
			ifFalse: [ super mapAndTrace: anObject ]