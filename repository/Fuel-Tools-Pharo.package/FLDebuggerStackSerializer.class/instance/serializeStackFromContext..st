serializing
serializeStackFromContext: aContext
	fileName := self fileNameForContext: aContext.
	self
		serializeStackFromContext: aContext
		toFileNamed: fileName