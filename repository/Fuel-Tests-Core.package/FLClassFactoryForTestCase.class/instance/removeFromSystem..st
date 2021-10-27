private-cleaning
removeFromSystem: aBehavior
	self class environment
		at: #ChangeSet
		ifPresent: [ :changeSet |
			aBehavior removeFromChanges ].
	
	aBehavior removeFromSystemUnlogged.
	
	aBehavior isObsolete ifFalse: [ ^ self ].
	
	aBehavior superclass ifNotNil: [ :superclass |
		superclass removeAllObsoleteSubclasses ]