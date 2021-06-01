private-cleaning
removeFromSystem: aBehavior
	aBehavior isObsolete
		ifTrue: [ ^ self ].
	self class environment at: #ChangeSet ifPresent: [ 
		aBehavior removeFromChanges ].
	
	aBehavior removeFromSystemUnlogged