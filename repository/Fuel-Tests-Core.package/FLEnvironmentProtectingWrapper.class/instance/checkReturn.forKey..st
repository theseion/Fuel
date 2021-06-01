accessing
checkReturn: anObject forKey: aKey
	anObject == sentinel ifTrue: [
		^ KeyNotFound signalFor: aKey ].
	^ anObject