accessing
preMaterializationActions
	^ map
		at: #preMaterializationActions
		ifAbsent: [ IdentityDictionary new ]