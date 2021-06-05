as yet unclassified
considerGlobal: aSymbol
	(self
		at: #globalSymbols
		ifAbsentPut: [ self class defaultGlobalSymbols asIdentitySet ])
			add: aSymbol