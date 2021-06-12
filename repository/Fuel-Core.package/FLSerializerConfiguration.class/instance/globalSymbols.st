as yet unclassified
globalSymbols
	^ map
		at: #globalSymbols
		ifAbsent: [ self class defaultGlobalSymbols asIdentitySet ]