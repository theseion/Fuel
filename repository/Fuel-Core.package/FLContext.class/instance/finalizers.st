accessing
finalizers
	^ map
		at: #finalizers
		ifAbsent: [ #() ]