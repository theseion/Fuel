as yet unclassified
preMaterializationActions
	^ self
		at: #preMaterializationActions
		ifAbsent: [ IdentityDictionary new ]