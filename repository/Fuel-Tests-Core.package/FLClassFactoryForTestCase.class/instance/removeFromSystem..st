private-cleaning
removeFromSystem: aBehavior
	aBehavior isObsolete
		ifTrue: [ ^ self ].
	self class environment at: #ChangeSet ifPresent: [ 
		aBehavior removeFromChanges ].
	
	aBehavior removeFromSystemUnlogged.
	
	"Environments aren't fully isolated yet. The behavior will have
	been removed from Smalltalk globals but not from our environment."
	self environment
		forgetClass: aBehavior
		logged: false