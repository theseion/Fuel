serialize/materialize
materializeReferencesOf: anObject with: aDecoder 
	mapping withIndexDo: [ :varIndex :index | 
			| reference |
			reference := aDecoder nextEncodedReference.
			varIndex
				ifNotNil: [
					anObject 
						instVarAt: varIndex
						put: reference ]
				ifNil: [
					"Stateful traits only"
					possibleTraitVariables ifNotNil: [
						"Since the variables from traits will only become known
						after the references have been fully materialized we
						don't yet know whether this variable is to be ignored
						or might be needed later"
						possibleTraitVariables
							at: (notIgnoredVariables at: index)
							put: reference ] ] ]