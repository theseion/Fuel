configuring
internalMethods
	^ self
		at: #internalMethods
		ifAbsentPut: [ IdentitySet new ]