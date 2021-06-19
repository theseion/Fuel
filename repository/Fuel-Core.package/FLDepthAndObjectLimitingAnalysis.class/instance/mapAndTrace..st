mapping
mapAndTrace: anObject
	anObject ifNil: [
		super mapAndTrace: anObject.
		^ self ].
	
	objectStack size - previousStackSize >= 0 ifTrue: [
		depth := depth + 1 ].
	previousStackSize := objectStack size.
	
	objectCounter := objectCounter + 1.
	
	objectCounter > objectLimit ifTrue: [
		self context handleObjectLimitExceeded ].
	
	(objectCounter > objectLimit or: [
		depth > depthLimit ])
			ifTrue: [
				firstMapper
					visitSubstitution: anObject
					by: nil ]
			ifFalse: [ super mapAndTrace: anObject ]