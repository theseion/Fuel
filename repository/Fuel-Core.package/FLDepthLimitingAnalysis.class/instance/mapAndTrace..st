mapping
mapAndTrace: anObject
	objectStack size - previousStackSize >= 0
		ifTrue: [ depth := depth + 1 ].
	previousStackSize := objectStack size.
	
	(anObject isNotNil and: [
		depth  > depthLimit])
			ifTrue: [
				firstMapper
					visitSubstitution: anObject
					by: nil ]
			ifFalse: [ super mapAndTrace: anObject ]