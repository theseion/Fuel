private
renameAndCompileInTarget
	| newMethod |
	newMethod := FLPlatform current
		renamedMethodCopyOf: self method
		selector: self selector.
	self targetClass addSelector: self selector withMethod: newMethod.
	self targetClass organization
		classify: self selector
		under: self extensionProtocolName