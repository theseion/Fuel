tests
testSerializeStackFromContext
	| stackSerializer context |
	stackSerializer := FLDebuggerStackSerializer new.
	
	context := [  ] asContext.
	stackSerializer	serializeStackFromContext: context.

	self assert: stackSerializer fileName asFileReference exists.
	self
		should: [ 
		FLMaterializer materializeFromFileNamed: stackSerializer fileName ]
		raise: FLDebuggerStackMaterialization