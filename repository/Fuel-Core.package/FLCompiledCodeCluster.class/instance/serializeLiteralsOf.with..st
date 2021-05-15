protected
serializeLiteralsOf: aCompiledBlock with: anEncoder
	1
		to: aCompiledBlock numLiterals 
		do: [ :index |
			anEncoder encodeReferenceTo: (aCompiledBlock literalAt: index) ]