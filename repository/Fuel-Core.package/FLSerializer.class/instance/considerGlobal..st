configuring-globals
considerGlobal: aSymbol
	(map
		at: #globalSymbols
		ifAbsentPut: [ self class defaultGlobalSymbols asIdentitySet ])
			add: aSymbol