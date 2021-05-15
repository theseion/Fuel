analyzing
referencesOf: compiledCode do: aBlock
	1
		to: compiledCode numLiterals
		do: [ :index | aBlock value: (compiledCode literalAt: index) ]