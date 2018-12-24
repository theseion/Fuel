private
renameAndCompileInTarget
	| newMethod |
	newMethod := FLPlatform current
		renamedMethodCopyOf: self method
		selector: self selector.
	FLPlatform current
		silentlyAddAndClassifySelector: self selector
		inClass: self targetClass
		withMethod: newMethod
		inProtocol: self extensionProtocolName