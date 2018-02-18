progress handling
notifyAnalized: anObject

	remainingCheckpoints
		remove: anObject
		ifAbsent: [ ^self ].
	progressBar current: self progress