accessing
substitutions
	^ map
		at: #substitutions
		ifAbsent: [ Bag new ]