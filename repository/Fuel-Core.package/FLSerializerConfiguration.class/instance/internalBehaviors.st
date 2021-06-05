configuring
internalBehaviors
	^ self
		at: #internalBehaviors
		ifAbsentPut: [ IdentitySet new ]