as yet unclassified
globalSymbols
	^ self
		at: #globalSymbols
		ifAbsent: [ self class defaultGlobalSymbols asIdentitySet ]