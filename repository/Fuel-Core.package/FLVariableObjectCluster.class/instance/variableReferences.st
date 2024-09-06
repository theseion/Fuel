accessing
variableReferences
"FLLargeIdentityDictionary -> IdentityDictionary"
	^ variableReferences ifNil: [ variableReferences := IdentityDictionary new ]