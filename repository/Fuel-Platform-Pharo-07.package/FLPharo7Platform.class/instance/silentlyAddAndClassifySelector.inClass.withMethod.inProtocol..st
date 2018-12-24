accessing-compiler
silentlyAddAndClassifySelector: aSymbol inClass: aClass withMethod: aCompiledMethod inProtocol: aString
	aClass
		addSelector: aSymbol
		withMethod: aCompiledMethod.
	aClass organization
		classify: aSymbol
		under: aString