tests
testSerializeContextToFileNamed
	| context file |
	context := [  ] asContext.
	file := 'serialized-stack' asFileReference.
	FLDebuggerStackSerializer
		serializeStackFromContext: context
		toFileNamed: 'serialized-stack'.

	self assert: file exists.
	self
		should: [ 
		FLMaterializer materializeFromFileNamed: 'serialized-stack' ]
		raise: FLDebuggerStackMaterialization