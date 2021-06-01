initialization
initialize
	super initialize.
	createdClasses := IdentitySet new.
	createdTraits := IdentitySet new.
	environment ifNil: [
		environment := self class environment ]