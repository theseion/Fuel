enumerating
additionalObjects
	^ map
		at: #additionalObjects
		ifAbsentPut: [ IdentityDictionary new ]