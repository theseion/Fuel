testing
includesKey: anObject
	^ overlay
		at: anObject
		ifPresent: [ :value |
			value == sentinel
				ifTrue: [ false ]
				ifFalse: [ environment includesKey: anObject ] ]
		ifAbsent: [ environment includesKey: anObject ]