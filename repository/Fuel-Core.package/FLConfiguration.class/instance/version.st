accessing
version
	^ self
		at: #version
		ifAbsent: [ FLVersion current ]