accessing
version
	^ map
		at: #version
		ifAbsent: [ FLVersion current ]