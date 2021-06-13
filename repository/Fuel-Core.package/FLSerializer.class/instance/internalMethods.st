configuring
internalMethods
	^ map
		at: #internalMethods
		ifAbsentPut: [ IdentitySet new ]