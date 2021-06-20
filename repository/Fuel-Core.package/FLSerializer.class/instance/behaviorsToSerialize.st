accessing
behaviorsToSerialize
	^ map
		at: #behaviorsToSerialize
		ifAbsentPut: [ IdentitySet new ]