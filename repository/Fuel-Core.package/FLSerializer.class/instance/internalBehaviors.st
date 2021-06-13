accessing
internalBehaviors
	^ map
		at: #internalBehaviors
		ifAbsentPut: [ IdentitySet new ]