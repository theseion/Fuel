tests
testFileNameForContext
	| stackSerializer context fileName |
	stackSerializer := FLDebuggerStackSerializer new.

	context := [  ] asContext.
	fileName := stackSerializer fileNameForContext: context.

	self deny: fileName equals: nil.
	self assert:
		('Debugger-Stack-' , context receiver class instanceSide name
		 , '-*.fuel' match: fileName)