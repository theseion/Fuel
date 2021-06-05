accessing
map
	^ map ifNil: [ map := IdentityDictionary new ]