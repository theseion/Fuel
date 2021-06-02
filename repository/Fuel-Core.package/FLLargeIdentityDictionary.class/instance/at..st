accessing
at: key
	self
		at: key
		ifPresent: [ :value | ^ value ]
		ifAbsent: [ self errorKeyNotFound: key ]