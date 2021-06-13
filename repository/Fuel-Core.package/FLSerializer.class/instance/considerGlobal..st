as yet unclassified
considerGlobal: aSymbol
	(map
		at: #globalSymbols
		ifAbsentPut: [ self class defaultGlobalSymbols asIdentitySet ])
			add: aSymbol