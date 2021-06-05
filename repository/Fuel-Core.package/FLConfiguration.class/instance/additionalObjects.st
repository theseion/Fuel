enumerating
additionalObjects
	^ self
		at: #additionalObjects
		ifAbsentPut: [ IdentityDictionary new ]