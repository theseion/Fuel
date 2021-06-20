private
computeGlobals
	| globals defaultGlobals configuredGlobals allGlobals |
	defaultGlobals := (self class defaultGlobalSymbols select: [ :symbol |
		self environment includesKey: symbol ]) asSet.
	configuredGlobals := map
		at: #globals
		ifAbsent: [ #() ].
	allGlobals := defaultGlobals, configuredGlobals.
	allGlobals isEmpty ifTrue: [ ^ IdentityDictionary new ].
	
	globals := IdentityDictionary new.
	allGlobals do: [ :object |
		globals add: (self globalAssociationFor: object) ].
	
	^ globals