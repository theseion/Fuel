accessing
postMaterializationActions
	^ map
		at: #postMaterializationActions
		ifAbsent: [ IdentityDictionary new ]