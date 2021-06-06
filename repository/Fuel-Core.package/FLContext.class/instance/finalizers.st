accessing
finalizers
	^ self
		at: #finalizers
		ifAbsent: [ #() ]