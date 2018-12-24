accessing-compiler
addAndClassifySelector: aSymbol inClass: aClass withMethod: aCompiledMethod inProtocol: aString
	aClass
		addAndClassifySelector: aSymbol
		withMethod: aCompiledMethod
		inProtocol: aString
		notifying: nil