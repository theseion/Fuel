accessing
methodsToSerialize
	^ map
		at: #methodsToSerialize
		ifAbsentPut: [ IdentitySet new ]