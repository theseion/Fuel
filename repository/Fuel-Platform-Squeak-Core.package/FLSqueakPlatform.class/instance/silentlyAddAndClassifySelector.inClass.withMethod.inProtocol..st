accessing-compiler
silentlyAddAndClassifySelector: aSymbol inClass: aClass withMethod: aCompiledMethod inProtocol: aString
	aClass
		addSelector: aSymbol
		withMethod: aCompiledMethod
		notifying: nil.
	aClass organization
		classify: aSymbol
		under: aString