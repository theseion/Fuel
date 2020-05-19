materializing
fixClassVariableReferencesOf: aCompiledCode

	"When the literals are serialized / materialized the ClassVariables and GlobalVariables are handled as simples associations, but they should be recovered to point to the correct classVariable"

	1 to: aCompiledCode numLiterals do: [ :anIndex | 
		| aLiteral |
		aLiteral := aCompiledCode literalAt: anIndex.
		((aLiteral isKindOf: ClassVariable) or:[aLiteral isKindOf: GlobalVariable])
			ifTrue: [ aCompiledCode
					literalAt: anIndex
					put: (aCompiledCode methodClass bindingOf: aLiteral name) ] ]