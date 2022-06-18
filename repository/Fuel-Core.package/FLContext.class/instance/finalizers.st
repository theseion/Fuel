finalization
finalizers
	^ map
		at: #finalizers
		ifAbsent: [ #() ]