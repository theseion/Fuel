as yet unclassified
postMaterializationActions
	^ self
		at: #postMaterializationActions
		ifAbsent: [ IdentityDictionary new ]