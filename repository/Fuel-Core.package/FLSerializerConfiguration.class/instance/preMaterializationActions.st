as yet unclassified
preMaterializationActions
	^ map
		at: #preMaterializationActions
		ifAbsent: [ IdentityDictionary new ]