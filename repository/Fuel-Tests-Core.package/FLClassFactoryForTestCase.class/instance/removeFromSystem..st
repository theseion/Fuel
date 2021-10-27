private-cleaning
removeFromSystem: aBehavior
	aBehavior isObsolete	ifTrue: [ ^ self ].
	
	self class environment
		at: #ChangeSet
		ifPresent: [ :changeSet |
			aBehavior removeFromChanges ].
	
	aBehavior removeFromSystemUnlogged