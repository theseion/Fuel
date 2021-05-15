protected
materializeLiteralsTo: compiledCode with: aDecoder
	1
		to: compiledCode numLiterals 
		do: [ :index |
			compiledCode
				literalAt: index
				put: aDecoder nextEncodedReference ]