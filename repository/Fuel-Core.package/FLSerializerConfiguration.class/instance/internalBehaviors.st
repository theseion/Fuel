configuring
internalBehaviors
	^ map
		at: #internalBehaviors
		ifAbsentPut: [ IdentitySet new ]